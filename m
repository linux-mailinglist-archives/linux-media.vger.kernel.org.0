Return-Path: <linux-media+bounces-62076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO0WLM/iC2qdQAUAu9opvQ
	(envelope-from <linux-media+bounces-62076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:10:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C79577232
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 06:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D406A304808D
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C318B2FE05B;
	Tue, 19 May 2026 04:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctLjxadB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D628C29B200
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 04:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779163729; cv=pass; b=UIx8ADbg+TVx/zOHFM7gO9LFZg3+P6dAU4AWScJ4Syyt9p4q22OYlgnnqd5ey7xa5Zb+IOza1xRMO8/RKu8Zj5rQoiAL7LRmQ6886SgcCWTKkko6e98EOHcRc0FC55rgiQ7cfDfyPflhlKLl7xLC0rhJWyrtg3Uf1I3pT0Y8S3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779163729; c=relaxed/simple;
	bh=t2cMNU2aA1KxvxZx7gAR15pb3MDXwlSILsNYkZLsYZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scTVolPazz35cMTMUS5cCWjndi83HGCcOulUijNQkeDHUt7HeOVSC7wPlfcMhUjN+v/7Qeg0yRDTj70OLQFOugtRZyLH9MuOQaWBc5XyjYNrFvtyTBkMBvQ5QOVW62Z4c3tleOG+6myb6tjwsbDFcvTzoRScZ5bDPcKLYdB1h5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctLjxadB; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c396d3b36so3149564d50.0
        for <linux-media@vger.kernel.org>; Mon, 18 May 2026 21:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779163726; cv=none;
        d=google.com; s=arc-20240605;
        b=SV+M/aL+qDOUe83H+7QvBVNaWbx5tKDeaIP/k2AxR6YH1KZESdyQywobjmOHGuMjiS
         mWXrBrBXLqpg+xh1vbZENlNgX1b7ipR/Dgdd5bJM4p+/MZ0utsfpyWm/uAZi+9oBxb6c
         yhTVUi+ri0NX+9RnJXiQunzK8RLeNhQEiv2yPXF0nsa0i6VNaR/4ld+GU80PHKGsdANv
         TtwtMFtaYyMIs5kcpUTwA4tgbsPYmuVjGqnykpgEL3xhm9ULxgAYdOFnOXRWCFdxcciZ
         3y1TFCDAsQx12OQoeQ+BAgetcGbYr2M5QxQJjbndnde5xFN7YVrYQ+Bfv3NJ72IcIUUP
         zWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7kA2hMel3rxxxc6CCqPFQDCtKlIGXB83OzM5cTPXrbQ=;
        fh=DfdCgovGU3mHub9iX+cacMBU/c83iQPDRWcou902k40=;
        b=iIZ3gSljkrH7b2UrZcg3Pec7FT97/ouX9MzuikvIemISLXUQoMIvhDyjRsBHt8DUrS
         MvJ/R6ns3W4HiGCTtwG4GsTQyz0pbzpjIEjMu7z12eUicHEBt/gwTIfhmiTVBfIxhnLM
         YMoxkWsyjNmpPCtIqp2pygc6ty1kXoHUzWPWczv2px0RcVu/scedBCk8T/Y58Gm0d9fq
         4Qd2zOmbjKFARoOQLvnBzhgu2TkkgWn7Xj40HYywM4vrf82StvorJyDnTlyXj07nkDpl
         enjhZI54vkqEV+2jJJKChrcIfgfOORk9KBZvchwyGBsmpT1Sd53vak0goy1TQy0MUr0E
         jlNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779163726; x=1779768526; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kA2hMel3rxxxc6CCqPFQDCtKlIGXB83OzM5cTPXrbQ=;
        b=ctLjxadBju125+KfH1+ocvwxvruILyh9VtI3nsbuDRjgBQpn+LB63NRdTyhapIFsBL
         hAslfpwPwY3Yzg3Swn2bOTpcif2fjuVWoNMXdAqr5133PB6mVcXvXZIFJDUTjTLljHuP
         gKvlzgeCjWmCiIrzjvqwz1BZZZbxp4ghhseG5UAy6I4jTTpdUEjNaQz8sjgbQ3tFY6XU
         k4B2jDCf5p8+XIuy6kmLqvF0EPWUGVZfqD5+UmBtP4Wwwe41pFV7kyEiX1sxZfUQdhwQ
         2eiNhX/DuCRG4uBfXF2/4dr8TH2rv/Xh//ZFsB9JRf/WhpnjQHJcevR84B6mwBjw1t2W
         R9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779163726; x=1779768526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7kA2hMel3rxxxc6CCqPFQDCtKlIGXB83OzM5cTPXrbQ=;
        b=bZYWyiADehsikp71sV5k0Rj4+RC2ITLHlIXB529MoMaa1csjDOjn7ZDeUaqE+9pUq5
         OIA3Zu4fIIkM896mJiy406qjSUUR4eL42Hpsm8KstUmYofJwSdvHU4Y2CCvuHyEOiC2E
         Fhka+vcxs9LDXilN0aiSos23PnlTTJxFIprS+aXc0uMsprJQPTWn3cSO3M/fZZ8ItyQ/
         +JBq7dxIdw5uSlcbINMsl8njA+lyJW3asgIx+LNcsVPnmeTmuD4guNDtG9NbX3W/WgBc
         HD45sbCFvs/Y/vgbXOlTpCcslTuR4AlzAj/VmJ5GGK+sOD6qJIqzLpUQWR8NYozAkz59
         nr2g==
X-Forwarded-Encrypted: i=1; AFNElJ/y/L9lwo2Hptb1CPTESUMS4xN2yyAjS36kJvnrSoKpbmarayMDXk9wXog0Eq1urtFtebAs1+8LvB0PVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9h9yqTCP5ARIeGhV9ze7qTHeyo1tGs3kouCzqDSCJksCuZ35M
	JrSagz7io2bnWWFYMmaErwFlDG8NrAiNiWr3lCNkj23mWLFH+DVYvOfk5iQBCqfE351Qggz5m5p
	6PckGDlwZHXPJhNrvvKbqDppM1toO56M=
X-Gm-Gg: Acq92OFR+Gu7eXnW/X2yhTTweq1MAOLChY7vgEltX8dTjVLqDYg7ckvYlJX/GQXLvBC
	ngQxVxLKgAr6vQ2cgHZFoGwT2CDrSd922sDVOzWBCFh4dWA09df74ouEcCxkuokc76bZhM5S/xi
	ew8xGo9Wsmby8PL+6tWwSMjcJbVeOm4+SX0cmLfXwKL/rWQ5I+37JtgrmwXEtDReAubh4x3Z7w6
	lQ7wNtFaqRPuroAFnT+cYMpNx3gVhczgrag3pVz3Tb7PogyUy0zb+gkM7X6aBKHmnpAI51ZMCRW
	MGwIq6j5
X-Received: by 2002:a05:690e:4192:b0:651:c642:92a6 with SMTP id
 956f58d0204a3-65e2276af55mr14893597d50.21.1779163726061; Mon, 18 May 2026
 21:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518105755.988961-1-lgs201920130244@gmail.com> <voc7mqvhim4gfaar4n6v3b3xkttzij7uaqs7lh7jriatyonoi4@tle3syly3hbi>
In-Reply-To: <voc7mqvhim4gfaar4n6v3b3xkttzij7uaqs7lh7jriatyonoi4@tle3syly3hbi>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 19 May 2026 12:08:33 +0800
X-Gm-Features: AVHnY4Kmevscl33_As9WRlCBA6NKiL2y-AhAuAVokGZCmpYURKETKpE7xfV4szc
Message-ID: <CANUHTR_VrfH44KB6Nng+yeGqLgBst+Xz0AsPp0J0Pap_rOF-OQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: iris: avoid double free on video register failure
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62076-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lgs201920130244@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 28C79577232
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dmitry,

Thanks for reviewing.

On Tue, 19 May 2026 at 01:12, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, May 18, 2026 at 06:57:55PM +0800, Guangshuo Li wrote:
> > iris_register_video_device() allocates a video_device with
> > video_device_alloc() and releases it from the err_vdev_release error path
> > if video_register_device() fails.
> >
> > This can double free the video_device when __video_register_device()
> > reaches device_register() and that call fails:
> >
> >   video_register_device()
> >     -> __video_register_device()
> >        -> device_register() fails
> >           -> put_device(&vdev->dev)
> >              -> v4l2_device_release()
> >                 -> vdev->release(vdev)
> >                    -> video_device_release(vdev)
> >
> >   iris_register_video_device()
> >     -> err_vdev_release
> >        -> video_device_release(vdev)
> >
> > Use video_device_release_empty() while registering the device so that
> > registration failure paths do not free vdev through vdev->release().
> > iris_register_video_device() then releases vdev exactly once from
> > err_vdev_release. Restore video_device_release() after successful
> > registration so the registered device keeps its normal lifetime handling.
>
> This is definitely not the correct way to handle the issue. Fix the
> error path instead.
>

I had also considered fixing this by changing the error path, but I am
a bit concerned about the interaction with the device_register()
failure path in __video_register_device().

Commit 2a934fdb01db ("media: v4l2-dev: fix error handling in
__video_register_device()") added put_device() after device_register()
fails, because after calling device_register(), the device must be
released with put_device() even if device_register() returns an error.
Otherwise the reference initialized by the driver core is not dropped,
which can cause a memory leak.

On the other hand, if I simply remove video_device_release() from the
video_register_device() failure path in iris_register_video_device(),
then earlier failures in __video_register_device() would leak the
video_device. Those earlier failures happen before device_register()
is called, so put_device() is not used and vdev->release() is not
invoked. In that case, the video_device allocated by
video_device_alloc() is still owned by the caller and still needs to
be released by video_device_release().

So there seem to be two different failure cases:

before device_register(): caller still needs video_device_release()

device_register() failure: __video_register_device() calls
put_device(), which may already invoke vdev->release()

Would you please share any suggestions on how to fix this issue properly?

Best regards,
Guangshuo

