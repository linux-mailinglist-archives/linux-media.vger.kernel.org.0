Return-Path: <linux-media+bounces-41750-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C15BB43219
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 08:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31AC21B28541
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 06:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D105253944;
	Thu,  4 Sep 2025 06:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9Y/4aIj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806B215F5C;
	Thu,  4 Sep 2025 06:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756966478; cv=none; b=r9jaop0EjGXoAUByEdqlGaDmYTkDRKtgLiPb7/d+eLrgitiA8/OP0Y/BfsdXLpORvrnfnTBXc8EUHRdROY2xQohGZaD8EM8VuJzyPzImWWUO+MjV+CKcD7Xd4Ai5HO1OalhtpJhEgY9sWtYbxKeWS5zbeVr5Nyl7tQkUBMdFzbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756966478; c=relaxed/simple;
	bh=h5IRpEFvyqWRnF/7H53pMjRelgAlphY2Ue73FauMSZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hV82ovcBCfVE2EXbfBYcLT0ClqSMjoE5pzk94368k/j0Sn97JbyWxAbFk4bgblA6RqQPmSz0Uj+KBlc2FtyDdhAd2RTYLwDyax+GES5GtzqROcipdI58l8cLqk/LsYzlBlk2fREh3ODl6+Sm8xW7tjZylOepCxX29axNZLSCSRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9Y/4aIj; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5608d792558so621285e87.0;
        Wed, 03 Sep 2025 23:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756966475; x=1757571275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A6GFjUwnMe/wXTGckXRK8aWWFaxKp5jPuLXCD+TWM1o=;
        b=j9Y/4aIjodtlP5XWl+uEId8+DDcql0Fwo5I5cpkshAEAWRylVt2AL5H4B9P1OCPP/V
         Z2RNKOc6WYESKIhWP+vIHKlLKsFnvzp6xsMrTXnnd9ROUKaERI4lNInlhbbLdIyHjbZT
         Q2f7c5J05tjXqDMdwYx194UYowqvKvGGZi4PBShD4JlmqDIlQOtoqiQ7R2r1R14iyr5e
         mKVt9sDssngVceQsRmfE+sELOTekfRqak/uPbFdu0m8W/28CY9v8SUUDL14lPpi2IsV7
         CSdun7U3507WWnxdeIpxlVvE0+CQL6hC2lIoQXdNpyYwZhWkq7Sa16/2S2iNjs7n7eFG
         aztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756966475; x=1757571275;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6GFjUwnMe/wXTGckXRK8aWWFaxKp5jPuLXCD+TWM1o=;
        b=vZvdVV+klxoWgubdUsbJohdsDIXJrC6/dgQlchpWUhBDPPuvJf4f+5BemhhrVy6Bc8
         WVDZovxDIjG8Tf8jDjwSCysQ3q0DnaGTNibtmG/7a+XsWJVKWIl4IuTC3OdiIQq1k+i2
         is8s+eW5bkj1RNUiqxiUHpZvI3leIqjMEzm137EiGLDgxsonlwaHkPtW8rw3NylNGh9P
         PTJXhWLUrdxsbXlrUIr/KHxEUhM3dHPGi98h2e6qQFAa81WTHC4EgcbfhCDw2eKmeXBW
         Fdptqam9LCR6+6q8C551E2XtVQBBWiKHkw4h+LMbbTX8bO7I5kH7mSBP9A0XBiXtgGbT
         0aBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUU7WuaWKkmpuTebzp2L47gUVoTvGiX64Jm6nYhIvmgISoRl46WV26lk2/8Le/zobhY+056IMdYB0/teI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzCx6jjjpamRZOSkli7CK0ULifDmcEwv0X6qhMe+ySqsKV0usF
	c5VOh8EinczhNw9BMgVK7kG98PUEzUmMyL9ReyoFigVQwDzQePE56684vrt9ZQ==
X-Gm-Gg: ASbGncszCfbho5KHNjtatu4eHKvv09nQHYcb0Kzhknx+FjdkmVAbE375tTVI5dnKZRL
	rhS4idzH5NF0/Tp6hB9BnTIHCSWgZWu7niyjlH1SA5OAofD2K+olDfbQoxj19Q6WfQiu3Aa2lFU
	R9/jv/fMzZOktoD0HlGO/u2ZHU6zFizG7syK5bBcP8UXWd8zVTQEgiJj3N6ErDLjApTye5EFUB3
	qo48zN7TCu13SeGSiQ84riI9mS6VTT8kw7m8bEhf1SBPj1ycuUKMRTKzHBFY4LP0G2djfqZ9hM8
	Hm/n/UmdKsn/X5dtBJLs6Xndgd7TH5tIKmuXd3RoQvDbFqL5l04V8G7gbOMgBICRKoOtuxUi6rJ
	YC7cwO2ewdMtxbGUZa/+xrQPLJmCTr3tMyT0f4mBJVP0=
X-Google-Smtp-Source: AGHT+IHK8A4UDfO5U2n8bbl1mJCAwNAfeC8IJsLEZCxMYRwsmc0O4a9+vOwg9soO/blDCwuhB3kp6w==
X-Received: by 2002:a05:6512:3a90:b0:55f:46d2:a5fa with SMTP id 2adb3069b0e04-55f708ec399mr5867249e87.36.1756966474719;
        Wed, 03 Sep 2025 23:14:34 -0700 (PDT)
Received: from foxbook (bhe29.neoplus.adsl.tpnet.pl. [83.28.94.29])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5e47asm990902e87.6.2025.09.03.23.14.33
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 03 Sep 2025 23:14:34 -0700 (PDT)
Date: Thu, 4 Sep 2025 08:14:29 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: uvcvideo: Shorten the transfer size non compliance
 message
Message-ID: <20250904081429.592e439f.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This message is much longer than others and doesn't fit even in a 160
column window when printed, despite providing little real information.

Also replace 'transmission' with 'transfer' because that's the actual
name and 'max packet' with 'limit' because it isn't same thing with
isochronus endpoints. Remove cryptic abbreviations like 'ep'.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---

By the way, this hack doesn't help much in the opposite case:
dwMaxPayloadTransferSize is right, but EP descriptors are a mess.

But no harm in trying, I guess.
I can live with it either way.


 drivers/media/usb/uvc/uvc_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 82d9d8ae059d..baf4ace41dbe 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -266,7 +266,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
 	if (stream->intf->num_altsetting > 1 &&
 	    ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
 		dev_warn_ratelimited(&stream->intf->dev,
-				     "UVC non compliance: the max payload transmission size (%u) exceeds the size of the ep max packet (%u). Using the max size.\n",
+				     "UVC non compliance: Reducing max payload transfer size (%u) to fit endpoint limit (%u).\n",
 				     ctrl->dwMaxPayloadTransferSize,
 				     stream->maxpsize);
 		ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
-- 
2.48.1

