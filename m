Return-Path: <linux-media+bounces-49866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2CCF0CEA
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 11:38:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9534300E03B
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 10:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1B23257848;
	Sun,  4 Jan 2026 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SOuOw04T"
X-Original-To: linux-media@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D381C69D;
	Sun,  4 Jan 2026 10:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767523130; cv=none; b=O37JEANqF3j+Lx1Dd9wkA8mp2dkDC9Jg9M+XMfz97QbXdk2Mjc4jO/GdvirE0gg9g5u1X/oTeBBFoxW+5bcrPtg+ljJqcDwCUZmkLTEN5ZjDQLhihXLW1HuFE3aTrD5ja3OsGMbMMbZY6K/cihhSgoPZj4mVTy8BYJo5LvRibME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767523130; c=relaxed/simple;
	bh=y3my1feCc8TyuXu87+WRmLX89Qb5CpDtCKPYjRuJg1A=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=HjJ+Wd2zzWPPZYYH22TuO3hQ8FGaumFsGyndGpBoRr6jiTPZEXYXVZUhKvFmjvKstzbkf427gBQZR5+TkEaiaHrivkL+ZYnsSmiRJajw/38nZA5oPKkgQq7hD3E7y+IeWUYWfhyW19eNnvIvNdHPrcUyzjpLcvqifU1lrrbSD50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SOuOw04T; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1767523126; x=1768127926; i=markus.elfring@web.de;
	bh=LA52qy3YSI4n46mUB7/LWyUIezH7Zjq2Xol5AhHh3qc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SOuOw04T+Abf/LVS8rYN9HR+ByaOcPrkyy1JlIwwn9AIniLzd28rhtjTEijS22nd
	 OGDbgr/4Gm2f/kazA3d80cc6svbRWQ59DW8tunT00DM0FusabUTPN+U4GHdbd6nyy
	 JEGcBG5ADqruGmnC5utGhLGtCg1S8f5KS36GuR6SQeqYEJLUwO3TKxkFxW5Xe60MT
	 F5qvxmJW/Qp/cNOPgwA0CfNm7vdD1NNp+9TMFlfUWpK3MxkVwhGe6Yiiy5DhuqrOp
	 7uav+TqC4eLgzfZS3GTlbMDBI3NhRYcDqwDqEdfpt39CFFWOtwvUzV6mfBCYkOz6A
	 5NGMmmPwrH+q4B8NpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.182]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBjIE-1vk5i729jo-00366C; Sun, 04
 Jan 2026 11:33:19 +0100
Message-ID: <78947b58-9621-49b5-b499-1c7232b62ee5@web.de>
Date: Sun, 4 Jan 2026 11:33:11 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Changcheng <chenchangcheng@kylinos.cn>, linux-media@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260104064520.115462-1-chenchangcheng@kylinos.cn>
Subject: Re: [PATCH] media: uvcvideo: Use scope-based cleanup helper
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260104064520.115462-1-chenchangcheng@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9UwJQ2FG2cid2T6wo8vs8Fms20bu8TneuPjP/7bAs3nJqCyUqlH
 sxIws6EvE4abs/FHmqlFC2v1C/tTmLi2KwVbLBDm2v/N5E2xx6BB9+EDCIKycWHrP6eHMVQ
 HTYQ2JpppmfmmrBFJ0bN7wQCv/Leip5UktjqybJ937dsT3IJness9BtQPmMnfQMUPI5mPOZ
 K4C7QnSwaiAyDXDzpt3Ww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:KhI/qx5cGmI=;lGgFzCee6NAb/WyVY+1LEHFC0bF
 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
 bBkMBn88zvgyEteaOs74gRoiSbfgz

> Replace the manual kfree() with __free(kfree) annotation for data
> references. This aligns the code with the latest kernel style.

              Align?


=E2=80=A6
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -291,7 +291,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *=
stream,
>  	struct uvc_streaming_control *ctrl, int probe, u8 query)
>  {
>  	u16 size =3D uvc_video_ctrl_size(stream);
> -	u8 *data;
> +	u8 *data __free(kfree) =3D NULL;
>  	int ret;
=E2=80=A6

How do you think about to reduce the scopes also for these local variables=
?


> @@ -317,8 +317,7 @@ static int uvc_get_video_ctrl(struct uvc_streaming *=
stream,
>  			"supported. Enabling workaround.\n");
>  		memset(ctrl, 0, sizeof(*ctrl));
>  		ctrl->wCompQuality =3D le16_to_cpup((__le16 *)data);
> -		ret =3D 0;
> -		goto out;
> +		return 0
>  	} else if (query =3D=3D UVC_GET_DEF && probe =3D=3D 1 && ret !=3D size=
) {
=E2=80=A6

Did you accidentally overlook the need for another semicolon here?

Regards,
Markus

