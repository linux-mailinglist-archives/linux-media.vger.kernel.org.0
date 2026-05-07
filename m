Return-Path: <linux-media+bounces-60813-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIBvLVKZ/Gn4RgAAu9opvQ
	(envelope-from <linux-media+bounces-60813-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:53:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B44A54E9A91
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DBF53016DBE
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFA6E3FAE1C;
	Thu,  7 May 2026 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG54V4UN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276B0359703
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161949; cv=pass; b=Mmgfm2/qYY3f3K44ueoScpyx5jKwmheoMbep6nD4YWywYmS4bQY1OCRSorJ1bEix51fE/qukrOT3hgbHRyYLznuixNAlLGWpcyxlkab1S7voB9SQbj7kr6K/EP1yacjIuNzhJRrgKnBdrNeMd9qWcpP2xLCT1LB9b4Q277++GpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161949; c=relaxed/simple;
	bh=KRwaHdksT4aTptGMK5j5s77NrG9FZxEiuA60DYpO1Io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVJY0c1y8O6UVHr4UhfADJRYmhsIoHYA75dkvI4p7l5/HPJTwYHZEdqDme9Hn0KZs37G8ZIxxyzAKXpg9XVO7JUtffxBoPznnv2BL5/PrdhmuSuqYisX2QOIuHu7AT3fZnV2NhylQv4OUnO7m2pKpsvF25PwPyrWOXPnE3rlH/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG54V4UN; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12dca45ca21so1333063c88.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 06:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778161947; cv=none;
        d=google.com; s=arc-20240605;
        b=GScD949f1P/gB3hAUjBzSW3hKVbfbted/WWYwv24Qxfg7ct3xMi47ojpzBMv76t5I6
         VpXd+yGVQeMkUnjP16BiSxinNGkneDEgCw2UOCyEFcdBTQSV6NRnz+pAuBRCJfi75BrZ
         dfthwenkCI1RSEPsehy4vNnvkZc02bBLe+KQeGiOP84VvJlhpaqZXSvH7KG8zUUhktNg
         UA3PkDDlSb5SpI/r9RuWnt0a1b7hDWj0arjbOdgrJSjwEFxWKU7JkC9Vrorcsp2g/qEL
         xiYi/XNhrgFxAm0xz3IcTRpbvxLg7yvj0NyBEZCm4N0UZoDcMqs7HRFT3mhZJVuU0BNf
         pHug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bGVpGj5HHW+JUpr36++44HV0d9D2Mz6mYHWRKyMr3NE=;
        fh=5hitxt88HO+3QMKJn+tCNdPke1cmnw7gal52zri5YJg=;
        b=ST6v6cFXpthD890S7PtBCbeJX9wMn5VxtX9JC+526PLMGbJzXQESjEx6L9oZg9fBAw
         cOkCMLetzL3WlF8kMZLl7t5zB8c9e5lNV14TM89a3kDxba1Q/GZEXwplY+847Rvi3Xv+
         qjYpBPljyINbUaFU97eK5jgjV85Asri4oY/JLuKQ01D4NpQkyfYA+MvaEcTo8eyfdhIl
         yR4Iz7M/iBLYVz/o4rmzc4P5fIAragMgheNsHLV1jZ6MKc0BZYaAtRfwIAYEHIYQ77fj
         EZea6TjCgTLtpyrpvUuTK3UuEwAWLc1Vtr23AGNG+v8G1SAfLRzW9XqHX6iw3hPkksXh
         XdRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778161947; x=1778766747; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bGVpGj5HHW+JUpr36++44HV0d9D2Mz6mYHWRKyMr3NE=;
        b=mG54V4UNDB5YKenS8iYZYRud1hqoDlh38IFqgTuGJBuoCyflUjZHg+nqTYOsXyyidL
         rfp6QsjB8XDh/MfdHso8+mw6FOr9NjdajxYvlLdC0JceBpLOkxH4rnmZVrCnX/ZlUsRh
         L53O8CCgcoJYDk5fXxl6wQkaVTHh2219ZTg5sAPf3LStpKbysdsVIBojXpoWi33oavDb
         n6z90EHIp9NuqIbnGBlmthT29B4MVoztj6FF+P51VAFI6+DioSj0a20QuCZ2ByDJfUT8
         MTHSynbxNv/nr/cblCnRDtgTgjBA7F0m3pBFQbGstMXI/JsjR1OsazQcUVzXwQ5ypP30
         bMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161947; x=1778766747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGVpGj5HHW+JUpr36++44HV0d9D2Mz6mYHWRKyMr3NE=;
        b=qAtNz/xUCX8tnjo85erl68Yn19KuYvFGp3anfQMdDYAGuwBexb5G4+3c2qwG1ecPGc
         vz2rxMHtLuA7BF9yJgFgyf3w9UEbUvCDVYslG0mKCP6mWQ0f/LoB/9VeKmZTfeY6cDwn
         TYc0Cn0UIOtTMeT+aVZWkaJZhbW4X77j3KB6F7kxdjD/UAOPy9fWkG99xYOUWD2e8b/m
         Q862VRgzAjkAFztHso3SCZG2umpjp9B4/A9oTMClUTXRi5b4YgT6mDasl+uwF7Bc7MCq
         R0dp03KNQzdwlkYXapTCvdrtAfqpjdocRMZq2SkxJg75JMc3MZ/qF89/k7KDdqgV6kIg
         8TRg==
X-Gm-Message-State: AOJu0YwCQHrYO+kM/s3KFZ+f3an3avI1aMA9kKcWNznlPl9JQW4gbG8x
	3g1j0KCJaxsKiegATjHzzkiorCBiq5k+ujgwPPHiuzzLwY8tscupuQoesDWDzXxRRxoXiatzqkV
	FVTjG+CJxxNSqze1Gj3+0wErS/cTS1ao=
X-Gm-Gg: AeBDievRbTfGqtXtH8zug5xCUpwhPZSa2OQvVwSxjsrTXxxwAzbuxMGsEHBwOV7FLFV
	1utEJzraiyht+9bTJK063IcWsDDznPu2pNNfZQNP9fcqioOHYopzDdxnMp1cm0ZikIvHUr4Sfzo
	55oD2C8Mjj0ILf8/IKHXh6ECtH5jQb3AwzrKm6ZKOcLyylmCxvvYqjc8T/iHcjowUifTott+lSX
	ywAS38H6PjYvu6nUVBr15OMkTYgM8PkEMA+pZSdAxldtuOpEkT0w+dd0d0Vi2EYsPbg7M868D6H
	Fqm+0BsNJKWeV9PU86Q=
X-Received: by 2002:a05:7022:397:b0:12c:34b9:61bc with SMTP id
 a92af1059eb24-131852d97bbmr3640712c88.5.1778161947269; Thu, 07 May 2026
 06:52:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-3-eagle.alexander923@gmail.com> <a7daefb2-3ab4-43db-b7cc-c3b7d0c0fae4@q-lab.dev>
In-Reply-To: <a7daefb2-3ab4-43db-b7cc-c3b7d0c0fae4@q-lab.dev>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu, 7 May 2026 16:52:15 +0300
X-Gm-Features: AVHnY4LdRP5lX1vkb9aowQufKGKoUyQ9w5QdIA-mvvR9K0p37g2wbCIy8KrK3cI
Message-ID: <CAP1tNvRRk9Qx=PctW4ryBexfyFt6igFQxx9TN0aOHDPtpMSkvg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor driver
To: Quentin Freimanis <quentin@q-lab.dev>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	devicetree@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: B44A54E9A91
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60813-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hello Quentin.

> > +static int ar0234_set_ctrl(struct v4l2_ctrl *ctrl)
...
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_HBLANK:
> > +             cci_write(ar0234->regmap, AR0234_REG_LINE_LENGTH_PCK,
> > +                       (ar0234->crop.width / 4) + ctrl->val, &ret);
>
> should be (crop->width + ctrl->val) / 4, &ret) to keep the control in
> units of pixels

This also results in changes for AR0234_HBLANK_MIN and the step
to control V4L2_CID_HBLANK, right?

> > +             break;
> > +     case V4L2_CID_VBLANK:
> > +             cci_write(ar0234->regmap, AR0234_REG_FRAME_LENGTH_LINES,
> > +                       ar0234->crop.height + ctrl->val, &ret);
> REG_FRAME_LENGTH_LINES seems to actually be total lines - 5
>
> I had to make these 2 changes to be able to get the expected framerate
> when not using the default 120fps.

Yes, I found it in the datasheet, thanks.

