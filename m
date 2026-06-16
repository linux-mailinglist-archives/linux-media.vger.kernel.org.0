Return-Path: <linux-media+bounces-64978-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VAJKJ1wUMWo9bQUAu9opvQ
	(envelope-from <linux-media+bounces-64978-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:16:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1654268D6FC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 11:16:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HobfYZQR;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64978-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64978-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7245301915B
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 09:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02578413235;
	Tue, 16 Jun 2026 09:16:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852E3451C6
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 09:16:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601368; cv=pass; b=jyRlwBwDZzQhGaXZNWIKOeAD2Ocq5MN9mCvifCp4FDmZQcJKJWKLpQqyUJQE1C3MZHM7A822TlysAnqN+Djst9v7FMEsiMW4avRzr9ZEXn3KP2mqcUc5sHPllEtXMRvZBZLoGQOVRyopQ56hfseSvFuoFZi0SdT5ji+tbrMsLDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601368; c=relaxed/simple;
	bh=kISvSbUir3l1OZYUIvvYdcVsXIjmleO+rZ0vgo771+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lfIYV7PSD2Al984crM4vW2sfOBlg+cFK2jYFzwF0ky1U2vLxAJLQui4eFsr9X5iw8ClwWONPFYBNZeJVYLd6rglHAyUAd/xy5GeXxX5up7fWJMoEk1pyrq8311HJbZQYjTPdKqm6VWhB7MSMnCArGAnLnMCZTB1zFCaKfOG060w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HobfYZQR; arc=pass smtp.client-ip=209.85.221.44
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-461a15bb7e8so354850f8f.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 02:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781601365; cv=none;
        d=google.com; s=arc-20240605;
        b=InTKvAS9wuPkTqDwMiIKcAYxqOF0dZIU9tG3r2IPS5VzLGV4jg2WGKLvxJRMor8WVl
         X7fuJ7+aXuNr/qmWJO8TD5uz7/DWTLrAQNxtZ+XrVsqpmihsTfM31BeYRKMygjkjlDE1
         25XAP3Hp+nSGGyseIsCANX47nMRGC3KMZ5PoKqpYgKWgRW8exHHdzbDtGjwoUtBbMs8j
         70YUw5q2Ih64pMV3WN8x6TK3j3QDljeAHfaa1hOd6MVd92H1T0tproZvtOXbnYIrrPd8
         Ds55mvD5Zed4tuzT86UvTBXBZTv54jCm4cHFyrQF92Q9seV2QZ6sOxRACkx0xKd9627E
         2CHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xBitHOg7u9wnE4xQQWBDM6Pk6MUfL6a2g74DT98eTmk=;
        fh=l06MyfSVeWbQiaIXWv+83fL+NORxgRSWLXo+SBielJw=;
        b=WK+5gjfVTMZDv0CxuU/uttjw41zMP4q4uzbg13qEN2l5rD90CdI2EX6jgdULlOupe5
         NxWNce5TiuWOwb7Bfaopytyh9hqYi7b3Ua3Maj40voBLw3E6Of+9PdgwKqZm5jRz0093
         +BcfP7PvATgxDhrVm4dw+9XTxEcJns4nW9Dq1D21dkHaXNfzenSTFbMi6tTvA+LpNRLR
         LZU7a6Z+NvxxFS0jSURvh3IB0IyhdY1zcAp0rGomUSyn20EcRA1WhF5Ot4SmfVx9Q59u
         A5l9mMk4YJQDhs8Es7W9TRKcoQw9jfzayDvu8y1hhGmL/yAvBgTXBRGVaIk1TFbtm5yc
         n5bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781601365; x=1782206165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBitHOg7u9wnE4xQQWBDM6Pk6MUfL6a2g74DT98eTmk=;
        b=HobfYZQRsLIXVaGSTySC2sAx2F4IwzGIh7O3pe4EEyylwdOvqcU7jd30NIjg2aCESC
         +Ug/ZG8+DS40PDWy7en0Xdll80NvU2cmKb0087s3hdrMkOpul+7gCBz9dQkAdawtwu0y
         mMcVTzHZZFqjMZkplfScpN5pFqjBzBtSBGC3Ju8wGNfDG9cbxI4XoCoKD1QRBDFqiPw/
         skixA9KJSC3IZXplGOI6GjVeZCSjai77rb4I86LliyIJspgEsmS3ew4NyvUu2O/5qyE3
         nihJ17KSkb/reMOmcwFRF2ir2l5Tq4s7D9iLDaLGyNV3M0ziOUH0MboMImgJyeUcg1FD
         eO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601365; x=1782206165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBitHOg7u9wnE4xQQWBDM6Pk6MUfL6a2g74DT98eTmk=;
        b=GYANqpL5fKMD64Lu1OBWhBQPEQT/0GdJiDtSkDxGTnsq4VMrrwDp9dLN8phVqTkQ/u
         TWM2ZShpo98flQ7WZ9ms9hlyTSi3WGmZTZ8F9zDGi3zGWRpMJU0egxJX3J8J1kZSeVhq
         6rWHQ6LAv0ufRdAC5DF16rpJ1OyR0htSkxsjT+EfS3kguLTdzEPYikejTlPhhhPk0FbE
         mAh20Jc7s7OxFV40I3sObuEf6eLQg7Y4ZI15gwAHVpq3/BerLPhltzXw38Yb4FH06ruo
         X+D+gA+i0zVI/5yxckEOv9JpNOLDnB20eLv8ysYt4ZqKtCzY6XtHUHFK9JnH+Ue04Pha
         5e3g==
X-Forwarded-Encrypted: i=1; AFNElJ/w1+duFSSClw2H97reHmM4weYpZdaEbGFqrDRKIX+mx5qCprI4XDjgGVDycuPsC1ZX7Pojo76igXJllQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw612e6R57omSUo5oz3GsC3T62rpYxWaNrzVJmyYVXFzoAz3lR3
	bMfY6UK/SvjeTttiotZAiTKHJc2ciNCJizLgjbZHC46RifiM8WrCCCx2TljAGrc9R4KrCqNPkFO
	UVqjagLIoJPvfPN3WnOdaQPbeIsiaWUYXpCshFcA=
X-Gm-Gg: Acq92OH6lUvaj5vuYX/Ljr02T2CbrUM/sdUt8y2ZE0ZUx3Fck/DoDQI0+mptth7PPxz
	9Oc11J0clqSBQ8SQTJEd24vP5g3Gx8Xd4GO6cDNYzwseh9AzVj1GYSwI22853IdUxMnGhoG0Zox
	t6hKgpjmsAgjQRlPxdXRNVY1WBhF9a6KTKMIDmhMskMDDYoUaXakg4gx7zjMKKAjSukQTsJ/ezL
	gmyGYMDGuwd98khKIah4A7xC0s1hQRxAZa1vJVnvlOwyXI504RbsgEPRBU5BIavFSb2qDktLb/p
	vLy5ik2kZYzspgXgsL5vYAlmGWrboe4OVB6QfFQrqU2vbO4r3OC6AXpalCG9hcTNyToVbw==
X-Received: by 2002:a05:6000:43d4:10b0:460:5a6f:c0df with SMTP id
 ffacd0b85a97d-4619f3afb82mr3818724f8f.22.1781601364870; Tue, 16 Jun 2026
 02:16:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260610-media-ci-7-2-v1-0-3c61a482a44e@chromium.org> <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
In-Reply-To: <20260610-media-ci-7-2-v1-2-3c61a482a44e@chromium.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 16 Jun 2026 10:15:38 +0100
X-Gm-Features: AVVi8Cfu8grPDvba7LPY_s1hYKwCvRu-3RFfsYcXQOlgXI-kPpT8Abiw8ZDPVCE
Message-ID: <CA+V-a8ugQ=GwWfJWdXDF9GzJGUjVWNoS5gc7_rdM_Tk2rt58bw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: rzg2l-cru: Remove unused kerneldoc description
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Xiaolei Wang <xiaolei.wang@windriver.com>, Tarang Raval <tarang.raval@siliconsignals.io>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ribalda@chromium.org,m:dave.stevenson@raspberrypi.com,m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:xiaolei.wang@windriver.com,m:tarang.raval@siliconsignals.io,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:dan.scally@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:laurent.pinchart@ideasonboard.com,m:mchehab+huawei@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64978-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,chromium.org:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1654268D6FC

On Wed, Jun 10, 2026 at 5:28=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.o=
rg> wrote:
>
> The variable has been previously removed but not its kerneldoc.
>
> Also remove the leftover reference to state in the description of qlock.
>
> This patch fixes the following warning:
>
> Warning: drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h:164
> Excess struct member 'state' description in 'rzg2l_cru_dev'
>
> Fixes: 85d8820d4869 ("media: rzg2l-cru: Remove the 'state' variable")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h | 2 --
>  1 file changed, 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drive=
rs/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 5bf334e173d2..b426bc7898bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -116,11 +116,9 @@ struct rzg2l_cru_info {
>   * @scratch_phys:      physical address of the scratch buffer
>   *
>   * @qlock:             protects @queue_buf, @buf_list, @sequence
> - *                     @state
>   * @queue_buf:         Keeps track of buffers given to HW slot
>   * @buf_list:          list of queued buffers
>   * @sequence:          V4L2 buffers sequence number
> - * @state:             keeps track of operation state
>   *
>   * @format:            active V4L2 pixel format
>   */
>
> --
> 2.54.0.1099.g489fc7bff1-goog
>
>

