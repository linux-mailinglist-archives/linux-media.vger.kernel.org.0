Return-Path: <linux-media+bounces-60355-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD7NBRqc+Wkn+QIAu9opvQ
	(envelope-from <linux-media+bounces-60355-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:28:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 813534C7EA8
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 09:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5C199304862C
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 07:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779373DC4B3;
	Tue,  5 May 2026 07:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UO+7hO9d"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606B37BE6D
	for <linux-media@vger.kernel.org>; Tue,  5 May 2026 07:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777966040; cv=pass; b=LUM+OzAlgZucs5TlzTzsHNJ9MgP3aBqNX52j54U4jMtjoUvc9hi0GRQKuiQ/KsgVjx5z//lAik2RqgSLBeuyiHgpylaX74xfec0CIWH+ejm4N4rfBolznkDG3zvXUCcLQPBbuud7TAPYMZctP63CkZ8MkUrKrlZDlsvWH8UF/lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777966040; c=relaxed/simple;
	bh=PbpnN7zjubPkyNBE0oNLSSQj2dervnjZBjCSlYIHeHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hR4Il5e4kDUqDSAT2XaAjr7dX+Pmr2KO3Ja92MBKfFY75Us7zC5XuiVLP26dofLhcDQOV034fSVxW6DwTjCoFHwj2xdj47BiffpukDtPpksJaQjUI7smo1r8jdMRDiNvc5JzEIjGK70o2WDRYA2X65riPaY88t9mAoxy+BfcwqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UO+7hO9d; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1309f4ee97fso1400549c88.1
        for <linux-media@vger.kernel.org>; Tue, 05 May 2026 00:27:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777966039; cv=none;
        d=google.com; s=arc-20240605;
        b=B1c4Xa2nSWl9+2YfqCnTSpE6m5tNRo+8Wc5FWGaKQUBattpx1WItsH1fwft4RKsxWN
         dLkNSgHNUfJPs8fJCZAIL++ra/oekpdkSh5dMpZqtW4PqgxPxWw4+X78ftb5HVOmSEd5
         DSKoj/kmlAE4kKp6TEx1xDg1PFB/sRwdrbIYbgObjchTDIA2/uDaWeg4bYMbe7EsITk1
         iqfBvJ64soPpnIwULrTK+34UV49b/xQFPwv8l1JhOoiKmYQKKjbh5Q3+w5DS9nIqsr1d
         D/Q0qu30hdB4838MUzNoNwdYa+neVt0S98Q0UvgOejrYC8M3qR0ew7uwQkl1k0VWZG7V
         5ePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aca/9UCtIaY71j8yr6efYm7SdCblDSHv1Jafvhs6kpI=;
        fh=vIxkCrUNvRcZMtRXNkExGFbzp8ZVvSzf0XC+FVG9qqY=;
        b=Gpl9CdJ5QPyn/bWOMsAEnBFB6GgVtPqVaKiw/DfUEWkWUUc1pWjNOk9wSqaqdiLf77
         pgta2crpeyl7AdBm39wlwH+qMwe99hdzDP/wR//FDCRvoM1lkeIPbqTEgnqw9YHM+j8y
         YKudoEwApO7c9/HeNOe9MqKSGJ2/mJO3IgufyKftkVdjrvBe9Cz0z/H/Mggq8mpfiMdS
         +emBLmdUgIpNEjZVMek1JacToFOIhNV9tEx00bVuZ2HXTcD4MaXVaRZQFndiX+XAfGL3
         hFM9E6aVgp0s15ZdTZFfRtP7sDxWrd7aSvX6IoQm5kSAeRy2AWFyUdaOfM5FFlWQ7Gok
         isMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777966039; x=1778570839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aca/9UCtIaY71j8yr6efYm7SdCblDSHv1Jafvhs6kpI=;
        b=UO+7hO9d3/cF8/wJE7/QbFjHTHHQ07YdPZlgSN2aPX3WGMHLFmLpNIdQ3Rd12oKmq9
         5Fpl3BSxvRmqIQ+vvrco3ESYt2O/7yvItORRdNopmBhtnu8uJBfo4TlKkHLLt253nvw+
         C+XU7XZPI4mMOhtc0xtrwsgSeWaULx7xQHyTPCAOSu6fnVcHyY4LXNNWgJp6S1F7OlPE
         gJuSY2w3J4iuLIBThz8s4eXO2aGXMnVUgQ28hgrhmTrspdCEpETmg/UGEfXUSeyIKAnj
         er7FYLHXYPc7goTd3/F63rDcn6wRg2CkBmV33EIcKX+cPPoMe7kYt1/dDtNLSY22moWj
         lH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777966039; x=1778570839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Aca/9UCtIaY71j8yr6efYm7SdCblDSHv1Jafvhs6kpI=;
        b=SK/z42hj1+kC1gV0zL0NYxTvFCkwz84bIecB4+7Eu9YQPw34V+3qy9aZFSqQo/tRz0
         k93Fndl+yExKLqalHL0CKcCQR3CVBLJiRN/DlnyoOtkjQJh4kEH/mkxUAn+RfETHML2Q
         gKzFV0RHxKyBzbCdepZlx3nPrJSV1x+KFZT2vZ6EPv/bTQ92+f8vFkPjVlsHRNQKEBhg
         oS6bCMnCWKNWnk474wsdDKqK7EGmVgDMo0ycY58Y8zqtYaSvEZXLMVhOp9agmc3l1E0L
         bM20UMT0JSXyriDR8c6ZEBHSLaP3f8NpGWajT61udBuZYNToT4A4E03BUdbsfHQg6e/D
         NUpA==
X-Gm-Message-State: AOJu0YzmuOIkZWvB8ixxtS1++ZWnLr8/cag3uWM004CYY5DGJTsrDGZt
	ndWKfccjbvyL/3y6PnripnqALn23V3+7TfoMioGLoZar7tMgE9KdFdG25zmcynNhTHd32ps32vj
	pX65PasrnstZ8G6yKuAbW5tRlAj6zTKw=
X-Gm-Gg: AeBDiesMUnMe37Ed+XX0HEIcfwEVpCy+U4UwX140B6Ham3FAK60JPROa8UZrzWOfxS5
	OG1lbiRKQExjDWswq3OlSHKzSxWQ1WBB0BOC+dKZLqlmMXmVm+3LsdoDLfeU6OHDOXtUcs54BP1
	o1vpykPYXu7mbhbMm161+iO78F8hQJK4CQFkzGT8BYkS5LRjKzH2d7sZ2zkdoja2oz1kQSFHtNz
	FwjPDBgfm4ZuRCN/Gx/EoeO3djyRxZfMcH5NtaVmDT7eh4xVge+BysNy3UIENq/bK2ViBYScjuh
	+D9SwOL1cYVGsplKRxhNS+crggsA
X-Received: by 2002:a05:701b:2804:b0:12d:ed19:e696 with SMTP id
 a92af1059eb24-12dfd8398eemr3269290c88.32.1777966038508; Tue, 05 May 2026
 00:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306103614.3208182-1-eagle.alexander923@gmail.com>
 <20260306103614.3208182-3-eagle.alexander923@gmail.com> <9bda558f-8ddd-49e1-ac5f-1f64a37fefb7@q-lab.dev>
In-Reply-To: <9bda558f-8ddd-49e1-ac5f-1f64a37fefb7@q-lab.dev>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Tue, 5 May 2026 10:27:05 +0300
X-Gm-Features: AVHnY4LTnhRObhgz4YCRXCH7qlO1-8HrkI2yL3kJOepDDUcv95OkEn-RRu8hID4
Message-ID: <CAP1tNvQhoqTSNTCSPr_yAHr0dPETLa23XX9VMe_oUrd6KC3Cdg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/2] media: i2c: Add onsemi AR0234 image sensor driver
To: Quentin Freimanis <quentin@q-lab.dev>
Cc: linux-media@vger.kernel.org, Isaac Scott <isaac.scott@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Dongcheng Yan <dongcheng.yan@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <johannes.goede@oss.qualcomm.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 813534C7EA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60355-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,ideasonboard.com,raspberrypi.com,intel.com,kernel.org,linux.intel.com,oss.qualcomm.com,linaro.org,foss.st.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,q-lab.dev:email]

Hi Quentin.

Thank you for testing the driver.

If you don=E2=80=99t mind, could you also try the current driver version?
https://github.com/MacroGroup/linux/blob/test/drivers/media/i2c/ar0234.c

I=E2=80=99ve made a number of fixes, especially in the selection API code.
I plan to post a non=E2=80=91RFC version soon, so any additional feedback o=
n
the current code
would be very helpful to improve the driver further.

Thanks!

> On 2026-03-06 2:36 a.m., Alexander Shiyan wrote:
> > +static int ar0234_identify_module(struct ar0234 *ar0234)
...

> > +     ret =3D clk_prepare_enable(ar0234->clk);
> > +     if (ret) {
> > +             dev_err(ar0234->dev, "Failed to enable clock\n");
> > +             regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies),
> > +                                    ar0234->supplies);
> > +             return ret;
> > +     }
> > +
> > +     gpiod_set_value_cansleep(ar0234->reset, 1);
>
> should be 0 to de-assert the reset pin to power on
>
> > +     /* ~160000 EXTCLKs */
> > +     usleep_range(27000, 28000);
> > +
> > +     return 0;
> > +}
> > +
> > +static int ar0234_power_off(struct device *dev)
> > +{
> > +     struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +     struct ar0234 *ar0234 =3D to_ar0234(sd);
> > +
> > +     gpiod_set_value_cansleep(ar0234->reset, 0);
>
> 1 to assert reset to power off
>
> > +     regulator_bulk_disable(ARRAY_SIZE(ar0234->supplies), ar0234->supp=
lies);
> > +     clk_disable_unprepare(ar0234->clk);
> > +     /* 100ms PwrDown until next PwrUp */
> > +     usleep_range(100000, 110000);
> > +
> > +     return 0;
> > +}
> > +
> after fixing the reset polarity locally I got the driver working with a
> rgb ar0234cs in 4-lane 10bit mode using a 24mhz extclk and a 448MHz link
> frequency.
>
> Tested-by: Quentin Freimanis <quentin@q-lab.dev>
> (after the reset fix)
>
> - Quentin

