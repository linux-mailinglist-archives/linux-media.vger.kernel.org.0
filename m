Return-Path: <linux-media+bounces-47249-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A26C67FF6
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 08:38:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 29BEC2A8B0
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 07:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B15A3054D1;
	Tue, 18 Nov 2025 07:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b="ZP6vu/bC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E0305948
	for <linux-media@vger.kernel.org>; Tue, 18 Nov 2025 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763451334; cv=none; b=NjHXBxcV9uDoQ8TINJP9SzEnQVr1NtsrIeNZ6x25OB/ndqCqgCWNo/Lve8IccBFm/7LG9k5CHZuXBbgHhLmLtfzbdEz2FfsAtHP0TudAV7B/SHbCeHgx4FAezjzgerK5zjjP+q7Ax0bv/gzevGEyY+wnv1Z2Olg9FV6zwYAPq1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763451334; c=relaxed/simple;
	bh=oaemDTGxSoF0TSfqxlm97azvolgJlykp4oTmZgJSyH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oiqg9SWxm2HSwTFl+9z/9ImJiwRhqtr3vUHPpaUmM+XWGF40npKxllrbahb2+csvDwqMrAq3uOGSFOipD9ABOeAIlfobG3kGrlqJUqyV5+YKsxA8J1/lKV2lgZdRPwLAyNrnjYo92US0EoKfaxni12qPg4WN6vFKZXyO7swqyIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com; spf=pass smtp.mailfrom=kerneltoast.com; dkim=pass (2048-bit key) header.d=kerneltoast.com header.i=@kerneltoast.com header.b=ZP6vu/bC; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ba2450aba80so2989271a12.1
        for <linux-media@vger.kernel.org>; Mon, 17 Nov 2025 23:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1763451329; x=1764056129; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/mXhMt0IXMqEYZdfannfwc+PTswEQau+PUSBy51i07w=;
        b=ZP6vu/bCU2en7j3Ph9LJUfF+rTSmmkrtD0Yw+aSclNW0dWS9SU8LftY/a+Gfg4wHWi
         +G2gM76Q/YWitVgCcBMTnZZ700shUO+APOVLwnqWhMwpr22FmO22ATKn+IWMFthkJ6Ex
         5xD8oHRb9JO6g1oHwR8LVb/mcyu4NOSd7Cf/PNAVFe7t50VCK56H2i0M5TMU/VDA5jU3
         /Fj5iDx7aNvTnw9rTFku3JgwcYBBwyDHYLmfS7/binHLf55Kiv2WjDUrcB2McdIr+DlS
         urcE6D5VrZO1+JpMlosyTkSaco3oIs8anByXO8HtEjig0uJ2+fOIfJ2Eko2u9ms+XRQU
         cmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763451329; x=1764056129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mXhMt0IXMqEYZdfannfwc+PTswEQau+PUSBy51i07w=;
        b=Gkq10YjcRUqGOKHfmhwBbfbKMyOg76QKs/Aqf7KSkTGCSzj24UP6n3mXVstygOmIst
         OejSPtO8JIou4W9Nq1ArSpj5eNym0slXK0/ExxV1/HhHcU5VrJHWb69y+jdBOfE1Ck3H
         6Wj8RhsYHIeX9JaMZPQUM6DKGFgHemDho4bNflfES3B9aR0f7SEIn2fg4WMMs3f4nnn0
         XwayUiHJu+W9b2aNq7QvM/cqpDxIfSlqxrKxSBpLMpKT3Nxb0saMWltaxEbZBelTNMS/
         Uwjvm6SNBPg/WWNCsncajBrKaMM83nve7tGm4TSVRsdMbB2T+VYklteJiED+uYXDgwfy
         qyeg==
X-Forwarded-Encrypted: i=1; AJvYcCV18IP2sQRurnBipQUZtrdx2v1X8VSwP4AEirsYeyWiSb0aku/FYElRjcBGzlleKj5BSKmj+FbOtbHFHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrxCzuXVVBPaxcbTdIZrtm0domC04jPZx1JpuYw91vjczpDNjv
	856M4Pv5wYWOyXlvYDlMtPGI7WtxN2Z+lSRFl+JRvOhfQWuMCY/ImqsH+951Oq2GZioB
X-Gm-Gg: ASbGncvv3Wpl9r+Ywy24OpQi/eyjdABgC1tyZtubJzn3Xc0vCBm9z4TpOBcpNj3wCKb
	nqH8NB9CixnpAhXE47mzsZt+4K6yErQE+/mt9nvea0t7gYJTjRJ8Ucdp9gcI/UTNlWQoin9gzsQ
	OiZIsWGX/+Eexh97IctabOmrRRD6zfcmP6dLE3M9/zoAiINPpmni/9lnqRNtfdvGzrI263UPeCa
	mFPtJQXUscsJR0eYlxF9hKsHFu6Ut42vWv11ZIRIGlubW10opc5CICEn/Pw3vjvHUOeUCeeK4T5
	JMHjfUHn44+sjBN8xbqRljqJrB2awJR5GTbArfEJtiQ4nU7kz8fjcFW+7KK1hu2LKn4q9s8ImUP
	/DT5VoSXsYtowXtbghTl9lqUnBkTZvT6amVS8g1bVzQ8CoSVYQNo2KrQAs1fXmyAcj7By7Bd16U
	MduGPMesCPsgzTrQ==
X-Google-Smtp-Source: AGHT+IFJOlrBEsPL/f/1gwjf9+tL+iWPk8uuzDMHndORTd/3C/LYI+LplcGX66uCTBMRq5D1vbQQAA==
X-Received: by 2002:a05:7300:3083:b0:2a4:78a0:480 with SMTP id 5a478bee46e88-2a4abaa2992mr7786618eec.13.1763451328310;
        Mon, 17 Nov 2025 23:35:28 -0800 (PST)
Received: from sultan-box ([142.147.89.233])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db102f5sm44060142eec.4.2025.11.17.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:35:27 -0800 (PST)
Date: Mon, 17 Nov 2025 23:35:20 -0800
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: "Du, Bin" <bin.du@amd.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
	gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
	Dominic.Antony@amd.com, mario.limonciello@amd.com,
	richard.gong@amd.com, anson.tsao@amd.com
Subject: Re: [PATCH v5 0/7] Add AMD ISP4 driver
Message-ID: <aRwhuNmPRlPGxIia@sultan-box>
References: <aRGjX1pv0y_lVext@sultan-box>
 <c41df0f5-b2b5-49f1-a49e-8750e55975e1@amd.com>
 <aRL8ZPwXSeKD4Qmn@sultan-box>
 <e09207fd-1879-44c8-a5c1-838a140dcd4b@amd.com>
 <aRPH1hV7bEfagPtE@sultan-box>
 <aRPhMCwJjpMqAROG@sultan-box>
 <d9afc6db-fd8a-4069-a8a8-1e2d74c1db3a@amd.com>
 <aRQyAdyiQjhsC11h@sultan-box>
 <aRQ5aA4Gus4iCVLp@sultan-box>
 <591efd28-805a-4a13-b7e2-0f78a3ca3eac@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="AgFja2OVHERMxdW1"
Content-Disposition: inline
In-Reply-To: <591efd28-805a-4a13-b7e2-0f78a3ca3eac@amd.com>


--AgFja2OVHERMxdW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 12, 2025 at 06:21:33PM +0800, Du, Bin wrote:
> 
> 
> On 11/12/2025 3:38 PM, Sultan Alsawaf wrote:
> > On Tue, Nov 11, 2025 at 11:06:41PM -0800, Sultan Alsawaf wrote:
> > > On Wed, Nov 12, 2025 at 02:32:51PM +0800, Du, Bin wrote:
> > > > Thanks Sultan for your information.
> > > > 
> > > > On 11/12/2025 9:21 AM, Sultan Alsawaf wrote:
> > > > > On Tue, Nov 11, 2025 at 03:33:42PM -0800, Sultan Alsawaf wrote:
> > > > > > On Tue, Nov 11, 2025 at 05:58:10PM +0800, Du, Bin wrote:
> > > > > > > 
> > > > > > > On 11/11/2025 5:05 PM, Sultan Alsawaf wrote:
> > > > > > > 
> > > > > > > > On Mon, Nov 10, 2025 at 05:46:28PM +0800, Du, Bin wrote:
> > > > > > > > > Thank you, Sultan, for your time, big effort, and constant support.
> > > > > > > > > Apologies for my delayed reply for being occupied a little with other
> > > > > > > > > matters.
> > > > > > > > > 
> > > > > > > > > On 11/10/2025 4:33 PM, Sultan Alsawaf wrote:
> > > > > > > > > > Hi Bin,
> > > > > > > > > > 
> > > > > > > > > > On Wed, Nov 05, 2025 at 01:25:58AM -0800, Sultan Alsawaf wrote:
> > > > > > > > > > > Hi Bin,
> > > > > > > > > > > 
> > > > > > > > > > > To expedite review, I've attached a patch containing a bunch of fixes I've made
> > > > > > > > > > > on top of v5. Most of my changes should be self-explanatory; feel free to ask
> > > > > > > > > > > further about specific changes if you have any questions.
> > > > > > > > > > > 
> > > > > > > > > > > I haven't had a chance to review all of the v4 -> v5 changes yet, but I figured
> > > > > > > > > > > I should send what I've got so far.
> > > > > > > > > > > 
> > > > > > > > > > > FYI, there is a regression in isp4if_dequeue_buffer() where the bufq lock isn't
> > > > > > > > > > > protecting the list_del() anymore. I also checked the compiler output when using
> > > > > > > > > > > guard() versus scoped_guard() in that function and there is no difference:
> > > > > > > > > > > 
> > > > > > > > > > >       sha1sum:
> > > > > > > > > > >       5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // guard()
> > > > > > > > > > >       5652a0306da22ea741d80a9e03a787d0f71758a8  isp4_interface.o // scoped_guard()
> > > > > > > > > > > 
> > > > > > > > > > > So guard() should be used there again, which I've done in my patch.
> > > > > > > > > > > 
> > > > > > > > > > > I also have a few questions:
> > > > > > > > > > > 
> > > > > > > > > > > 1. Does ISP FW provide a register interface to disable the IRQ? If so, it is
> > > > > > > > > > >        faster to use that than using disable_irq_nosync() to disable the IRQ from
> > > > > > > > > > >        the CPU's side.
> > > > > > > > > > > 
> > > > > > > > > > > 2. When the IRQ is re-enabled in isp4sd_fw_resp_func(), is there anything
> > > > > > > > > > >        beforehand to mask all pending interrupts from the ISP so that there isn't a
> > > > > > > > > > >        bunch of stale interrupts firing as soon the IRQ is re-enabled?
> > > > > > > > > > > 
> > > > > > > > > > > 3. Is there any risk of deadlock due to the stream kthread racing with the ISP
> > > > > > > > > > >        when the ISP posts a new response _after_ the kthread determines there are no
> > > > > > > > > > >        more new responses but _before_ the enable_irq() in isp4sd_fw_resp_func()?
> > > > > > > > > > > 
> > > > > > > > > > > 4. Why are some lines much longer than before? It seems inconsistent that now
> > > > > > > > > > >        there is a mix of several lines wrapped to 80 cols and many lines going
> > > > > > > > > > >        beyond 80 cols. And there are multiple places where code is wrapped before
> > > > > > > > > > >        reaching 80 cols even with lots of room left, specifically for cases where it
> > > > > > > > > > >        wouldn't hurt readability to put more characters onto each line.
> > > > > > > > > > 
> > > > > > > > > > I've attached a new, complete patch of changes to apply on top of v5. You may
> > > > > > > > > > ignore the incomplete patch from my previous email and use the new one instead.
> > > > > > > > > > 
> > > > > > > > > > I made many changes and also answered questions 1-3 myself.
> > > > > > > > > > 
> > > > > > > > > > Please apply this on top of v5 and let me know if you have any questions.
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Sure, will review, apply and test your patch accordingly. Your contribution
> > > > > > > > > is greatly appreciated, will let you know if there is any question or
> > > > > > > > > problem.
> > > > > > > > > 
> > > > > > > > > > BTW, I noticed a strange regression in v5 even without any of my changes: every
> > > > > > > > > > time you use cheese after using it one time, the video will freeze after 30-60
> > > > > > > > > > seconds with this message printed to dmesg:
> > > > > > > > > >       [ 2032.716559] amd_isp_capture amd_isp_capture: -><- fail respid unknown respid(0x30002)
> > > > > > > > > > 
> > > > > > > > > > And the video never unfreezes. I haven't found the cause for the regression yet;
> > > > > > > > > > can you try to reproduce it?
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Really weird, we don't see this issue either in dev or QA test. Is it 100%
> > > > > > > > > reproducible and any other fail or err in the log?
> > > > > > > > 
> > > > > > > > Yes, it's 100% reproducible. There's no other message in dmesg, only that one.
> > > > > > > > 
> > > > > > > > Sometimes there is a stop stream error when I close cheese after it froze:
> > > > > > > > 
> > > > > > > >      [  656.540307] amd_isp_capture amd_isp_capture: fail to disable stream
> > > > > > > >      [  657.046633] amd_isp_capture amd_isp_capture: fail to stop steam
> > > > > > > >      [  657.047224] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
> > > > > > > > 
> > > > > > > > When I revert to v4 I cannot reproduce it at all. It seems to be something in
> > > > > > > > v4 -> v5 that is not fixed by any of my changes.
> > > > > > > > 
> > > > > > > 
> > > > > > > Hi Sultan, could you please try following modifications on top of v5 to see
> > > > > > > if it helps?
> > > > > > > 
> > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > index 39c2265121f9..d571b3873edb 100644
> > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > > @@ -97,7 +97,7 @@
> > > > > > > 
> > > > > > > #define ADDR_SPACE_TYPE_GPU_VA          4
> > > > > > > 
> > > > > > > -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
> > > > > > > +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
> > > > > > > 
> > > > > > > /*
> > > > > > >     * standard ISP mipicsi=>isp
> > > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > index 248d10076ae8..acbc80aa709e 100644
> > > > > > > --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > > @@ -697,7 +697,7 @@ static int isp4sd_stop_resp_proc_threads(struct
> > > > > > > isp4_subdev *isp_subdev)
> > > > > > >           return 0;
> > > > > > > }
> > > > > > > 
> > > > > > > -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> > > > > > > +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool
> > > > > > > irq_enabled)
> > > > > > > {
> > > > > > >           struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > > > > >           unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
> > > > > > > @@ -716,8 +716,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev
> > > > > > > *isp_subdev)
> > > > > > >                   return 0;
> > > > > > >           }
> > > > > > > 
> > > > > > > -       for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > -               disable_irq(isp_subdev->irq[i]);
> > > > > > > +       if (irq_enabled)
> > > > > > > +               for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > > +                       disable_irq(isp_subdev->irq[i]);
> > > > > > > 
> > > > > > >           isp4sd_stop_resp_proc_threads(isp_subdev);
> > > > > > >           dev_dbg(dev, "isp_subdev stop resp proc streads suc");
> > > > > > > @@ -813,7 +814,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev
> > > > > > > *isp_subdev)
> > > > > > > 
> > > > > > >           return 0;
> > > > > > > err_unlock_and_close:
> > > > > > > -       isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > +       isp4sd_pwroff_and_deinit(isp_subdev, false);
> > > > > > >           return -EINVAL;
> > > > > > > }
> > > > > > > 
> > > > > > > @@ -985,7 +986,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int
> > > > > > > on)
> > > > > > >           if (on)
> > > > > > >                   return isp4sd_pwron_and_init(isp_subdev);
> > > > > > >           else
> > > > > > > -               return isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > > +               return isp4sd_pwroff_and_deinit(isp_subdev, true);
> > > > > > > }
> > > > > > > 
> > > > > > > static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
> > > > > > 
> > > > > > No difference sadly; same symptoms as before. FYI, your email client broke the
> > > > > > patch formatting so I couldn't apply it; it hard wrapped some lines to 80 cols,
> > > > > > replaced tabs with spaces, and removed leading spaces on each context line, so I
> > > > > > had to apply it manually. To confirm I applied it correctly, here is my diff:
> > > > > > 
> > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > index 39c2265121f9..d571b3873edb 100644
> > > > > > --- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
> > > > > > @@ -97,7 +97,7 @@
> > > > > >    #define ADDR_SPACE_TYPE_GPU_VA          4
> > > > > > -#define FW_MEMORY_POOL_SIZE             (200 * 1024 * 1024)
> > > > > > +#define FW_MEMORY_POOL_SIZE             (100 * 1024 * 1024)
> > > > > >    /*
> > > > > >     * standard ISP mipicsi=>isp
> > > > > > diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > index 4bd2ebf0f694..500ef0af8a41 100644
> > > > > > --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> > > > > > @@ -669,7 +669,7 @@ static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
> > > > > >    	return 0;
> > > > > >    }
> > > > > > -static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> > > > > > +static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev, bool irq_enabled)
> > > > > >    {
> > > > > >    	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
> > > > > >    	unsigned int perf_state = ISP4SD_PERFORMANCE_STATE_LOW;
> > > > > > @@ -688,8 +688,9 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
> > > > > >    		return 0;
> > > > > >    	}
> > > > > > -	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > -		disable_irq(isp_subdev->irq[i]);
> > > > > > +	if (irq_enabled)
> > > > > > +		for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
> > > > > > +			disable_irq(isp_subdev->irq[i]);
> > > > > >    	isp4sd_stop_resp_proc_threads(isp_subdev);
> > > > > >    	dev_dbg(dev, "isp_subdev stop resp proc streads suc");
> > > > > > @@ -785,7 +786,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
> > > > > >    	return 0;
> > > > > >    err_unlock_and_close:
> > > > > > -	isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > +	isp4sd_pwroff_and_deinit(isp_subdev, false);
> > > > > >    	return -EINVAL;
> > > > > >    }
> > > > > > @@ -957,7 +958,7 @@ static int isp4sd_set_power(struct v4l2_subdev *sd, int on)
> > > > > >    	if (on)
> > > > > >    		return isp4sd_pwron_and_init(isp_subdev);
> > > > > >    	else
> > > > > > -		return isp4sd_pwroff_and_deinit(isp_subdev);
> > > > > > +		return isp4sd_pwroff_and_deinit(isp_subdev, true);
> > > > > >    }
> > > > > >    static const struct v4l2_subdev_core_ops isp4sd_core_ops = {
> > > > > > 
> > > > > > > On the other hand, please also add the patch in amdgpu which sets *bo to
> > > > > > > NULL in isp_kernel_buffer_alloc() which you mentioned in another thread.
> > > > > > 
> > > > > > Yep, I have been doing all v5 testing with that patch applied.
> > > > > > 
> > > > > > BTW, I have verified the IRQ changes are not the cause for the regression; I
> > > > > > tested with IRQs kept enabled all the time and the issue still occurs.
> > > > > > 
> > > > > > I did observe that ISP stops sending interrupts when the video stream freezes.
> > > > > > And, if I replicate the bug enough times, it seems to permanently break FW until
> > > > > > a full machine reboot. Reloading amd_capture with the v4 driver doesn't recover
> > > > > > the ISP when this happens.
> > > > > > 
> > > > > > As an improvement to the driver, can we do a hard reset of ISP on driver probe?
> > > > > > I am assuming hardware doesn't need too long to settle after hard reset, maybe
> > > > > > a few hundred milliseconds? This would ensure ISP FW is always in a working
> > > > > > state when the driver is loaded.
> > > > > > 
> > > > 
> > > > Actually, each time the camera is activated, the ISP driver powers on the
> > > > ISP and initiates its firmware from the beginning; when the camera is
> > > > closed, the ISP is powered off..
> > > 
> > > Hmm, well I am able to put the ISP in a completely unusable state that doesn't
> > > recover when I unload and reload amd_capture. Or maybe it is the sensor that is
> > > stuck in a broken state?
> > 
> > Here is the log output when I try to start cheese after unloading and reloading
> > amd_capture, where the ISP is in the broken state that requires rebooting the
> > laptop (annotated with notes of what I saw/did at each point in time):
> > 
> > ==> opened cheese
> > ==> cheese froze after a few seconds
> > ==> closed cheese
> >    [   34.570823] amd_isp_capture amd_isp_capture: fail to disable stream
> >    [   35.077503] amd_isp_capture amd_isp_capture: fail to stop steam
> >    [   35.077525] amd_isp_capture amd_isp_capture: disabling streaming failed (-110)
> > ==> unloaded amd_capture
> > ==> loaded amd_capture
> > ==> opened cheese
> >    [  308.039721] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
> >    [  308.043961] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
> >    [  308.044188] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044194] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044196] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044197] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044198] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044199] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044200] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044201] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.044202] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.065226] amd_isp_capture amd_isp_capture: power up isp fail -22
> >    [  308.174814] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
> >    [  308.177807] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
> >    [  308.178036] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178043] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178044] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178045] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178046] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178047] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178048] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178049] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.178050] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.198776] amd_isp_capture amd_isp_capture: power up isp fail -22
> >    [  308.306835] amd_isp_capture amd_isp_capture: ISP CCPU FW boot failed
> >    [  308.311533] amd_isp_capture amd_isp_capture: fail to start isp_subdev interface
> >    [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311723] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311724] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311725] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311726] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.311727] amd_isp_capture amd_isp_capture: invalid mem_info
> >    [  308.335281] amd_isp_capture amd_isp_capture: power up isp fail -22
> > 
> 
> Thanks Sultan for the detailed info, I agree with you, tend to believe it
> may related to the sensor, I will follow up with the FW team to investigate
> further.
> 
> > > > > > Thanks,
> > > > > > Sultan
> > > > > 
> > > > > A small update: I reproduced the issue on v4, but it took several more cycles of
> > > > > closing/opening cheese and waiting 30s compared to v5.
> > > > > 
> > > > > Right now my best guess is that this is a timing issue with respect to FW that
> > > > > was exposed by the v5 changes. v5 introduced slight changes in code timing, like
> > > > > with the mutex locks getting replaced by spin locks.
> > > > > 
> > > > > I'll try to insert mdelays to see if I can expose the issue that way on v4.
> > > > > 
> > > > 
> > > > Could you kindly provide the FW used?
> > > 
> > >    commit a89515d3ff79f12099f7a51b0f4932b881b7720e
> > >    Author: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > >    Date:   Thu Aug 21 15:40:45 2025 -0400
> > > 
> > >        amdgpu: Update ISP FW for isp v4.1.1
> > >        From internal git commit:
> > >        24557b7326e539183b3bc44cf8e1496c74d383d6
> > >        Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> > > 
> > > Sultan
> > 
> > Sultan
> 
> -- 
> Regards,
> Bin
> 

Thanks, Bin. I looked deeper at the code and didn't find any reason the issue
could be due to the driver. Also, the problem happens outside of cheese for me
(like in Chromium with Zoom meetings), so v5 of the driver is pretty much
unusable for me until this issue is fixed. :(

I've attached a v2 of my big patch, which includes more improvements and another
ringbuffer bug fix. Please check the ringbuffer logic on the FW side to make
sure FW doesn't have the same bug, where it may let rd_ptr == wr_ptr upon
filling the ringbuffer, even though rd_ptr == wr_ptr is supposed to indicate the
ringbuffer is empty.

Also, I have a suggestion for a FW change to improve IRQ handling in the driver:

1. Change ISP_SYS_INT0_ACK behavior so that it also clears the acked interrupts
   from ISP_SYS_INT0_EN.

2. Change ISP_SYS_INT0_EN behavior so that it only enables the interrupts in the
   provided mask, so RMW of ISP_SYS_INT0_EN in the driver won't be necessary to
   re-enable interrupts for a stream.

Sultan

--AgFja2OVHERMxdW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=v2-media-platform-amd-Big-squash-of-fixes-cleanup-on.patch

From f17548068518afdbe4cd3aea2631ffd9c0cea206 Mon Sep 17 00:00:00 2001
From: Sultan Alsawaf <sultan@kerneltoast.com>
Date: Mon, 17 Nov 2025 23:15:57 -0800
Subject: [PATCH v2] media: platform: amd: Big squash of fixes/cleanup on top
 of v5 patchset

-Rewrote IRQ handling to disable/enable interrupts using ISP register since
 it is faster
-Rewrote ringbuffer handling in isp4if_f2h_resp(), fixing the safety checks
 to check the read pointer before doing memcpy possibly out-of-bounds on
 the ringbuffer. Also simplified the ringbuffer logic a lot.
-Rewrote ringbuffer handling in isp4if_is_cmdq_rb_full(), fixing an
 off-by-one in the safety checks that could let rd_ptr == wr_ptr when the
 ringbuf is full
-Rewrote ringbuffer handling in isp4if_insert_isp_fw_cmd(), simplifying it
 a lot
-Fixed a regression in v4 -> v5 where isp4if_dequeue_buffer() didn't
 protect the list_del with bufq_lock
-Fixed a subtle use-after-free possibility when the timeout is hit on a
 sync command at the same time the command finishes, existed since v1
-Added missing pm_runtime_disable() to isp4_capture_remove() and to
 isp4_capture_probe() error path
-Cleaned up all remaining stray semicolons after curly close braces
-Cleaned up and improved macro definitions in isp4_interface.h
-Removed needless (u8 *) casts
-Added missing memset for FW command struct in isp4sd_stop_stream()
-Removed streams 2 and 3 from ISP4IF_FW_RESP_RB_IRQ_EN_MASK so they don't
 get enabled in the interrupt enable register
-Added error handling to cleanup kthreads when there is a failure in
 starting a kthread
-Fixed a race on kthread creation where it is possible the waitqueue head
 isn't initialized by the time it is used in the IRQ handler, because the
 kthread was responsible for initializing the waitqueue head
-Removed an always false status check in isp4sd_pwroff_and_deinit()
-Fixed isp4sd_init_stream() getting called in isp4sd_start_stream() even
 after a stream is started, and reordered all of those status checks to
 come before isp4sd_init_stream()
-Fixed error handling in isp4sd_start_stream() to return the received
 error from a function that failed
-Moved dbg message in isp4sd_stop_stream() to go under the lock because it
 reads output_info->start_status
-Removed the GET_*_REG_BASE() macros, unnecessary and redundant
-Removed isp4sd_is_stream_running()
-Fixed incorrect err message in isp4sd_init_stream() due to copy/paste
 error
-Optimized struct isp4fw_buffer interface to turn the three buffers into an
 array with a single u64 address instead of high/low u32 addresses
-Optimized struct isp4fw_resp_param_package to combine the pkg high/low
 addresses into a single u64
-Optimized struct isp4_interface to remove FW ring buffer configs
-Removed isp4sd_is_stream_running
-Removed isp4if_split_addr64() and isp4if_join_addr64(), no longer needed
-Removed pdev member from struct isp4_device, unneeded
-Corrected 'isp_mmip' parameter name typo in isp4if_init()
-Eliminated a hole in struct isp4_subdev
-Lots of dead code cleanup and small code style cleanups throughout

Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
---
v1 -> v2 changes:

-Rewrote ringbuffer handling in isp4if_is_cmdq_rb_full(), fixing an
 off-by-one in the safety checks that could let rd_ptr == wr_ptr when the
 ringbuf is full
-Optimized struct isp4fw_buffer interface to turn the three buffers into an
 array with a single u64 address instead of high/low u32 addresses
-Optimized struct isp4fw_resp_param_package to combine the pkg high/low
 addresses into a single u64
-Optimized struct isp4_interface to remove FW ring buffer configs
-Better IRQ handling, holds the irq lock for less time
-Removed isp4sd_is_stream_running()
-Corrected 'isp_mmip' parameter name typo in isp4if_init()
-Rewrote ringbuffer handling in isp4if_insert_isp_fw_cmd(), simplifying it
 a lot
-Cleaned up and improved macro definitions in isp4_interface.h
-Removed needless (u8 *) casts
-Removed GET_ISP4IF_REG_BASE()
-Removed isp4if_split_addr64() and isp4if_join_addr64(), no longer needed
-Removed pdev member from struct isp4_device, unneeded
-Eliminated a hole in struct isp4_subdev
---
 drivers/media/platform/amd/isp4/isp4.c        | 154 ++---
 drivers/media/platform/amd/isp4/isp4.h        |   5 +-
 drivers/media/platform/amd/isp4/isp4_debug.c  |  28 +-
 .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  18 +-
 .../media/platform/amd/isp4/isp4_interface.c  | 534 +++++++-----------
 .../media/platform/amd/isp4/isp4_interface.h  |  72 +--
 drivers/media/platform/amd/isp4/isp4_subdev.c | 439 ++++++--------
 drivers/media/platform/amd/isp4/isp4_subdev.h |   7 +-
 drivers/media/platform/amd/isp4/isp4_video.c  |  49 +-
 drivers/media/platform/amd/isp4/isp4_video.h  |  23 +-
 10 files changed, 519 insertions(+), 810 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index 78a7a998d86e..6c5ca581e0ce 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -18,72 +18,93 @@
 	(ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
 	 ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
 
-const char *isp4_irq_name[] = {
-	"isp_irq_global",
-	"isp_irq_stream1"
+static const struct {
+	const char *name;
+	u32 status_mask;
+	u32 en_mask;
+	u32 ack_mask;
+	u32 rb_int_num;
+} isp4_irq[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
+	/* The IRQ order is aligned with the isp4_subdev.fw_resp_thread order */
+	{
+		.name = "isp_irq_global",
+		.status_mask = ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK,
+		.en_mask = ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK,
+		.ack_mask = ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK,
+		.rb_int_num = 4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
+	},
+	{
+		.name = "isp_irq_stream1",
+		.status_mask = ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK,
+		.en_mask = ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK,
+		.ack_mask = ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK,
+		.rb_int_num = 0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
+	},
 };
 
-const u32 isp4_irq_status_mask[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
-	/* global response */
-	ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK,
-	/* stream 1 response */
-	ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK
-};
-
-const u32 isp4_irq_ack_mask[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
-	/* global ack */
-	ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK,
-	/* stream 1 ack */
-	ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK
-};
-
-/* irq num, the irq order is aligend with the isp4_subdev.fw_resp_thread order */
-static const u32 isp4_ringbuf_interrupt_num[ISP4SD_MAX_FW_RESP_STREAM_NUM] = {
-	4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
-	0  /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
-};
-
-static void isp4_wake_up_resp_thread(struct isp4_subdev *isp_subdev, u32 index)
+void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, bool enable)
 {
-	if (isp_subdev && index < ISP4SD_MAX_FW_RESP_STREAM_NUM) {
-		struct isp4sd_thread_handler *thread_ctx = &isp_subdev->fw_resp_thread[index];
-
-		thread_ctx->wq_cond = 1;
-		wake_up_interruptible(&thread_ctx->waitq);
-	}
+	u32 intr_en;
+
+	/* Synchronize ISP_SYS_INT0_EN writes with the IRQ handler's writes */
+	spin_lock_irq(&isp_subdev->irq_lock);
+	intr_en = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_EN);
+	if (enable)
+		intr_en |= isp4_irq[index].en_mask;
+	else
+		intr_en &= ~isp4_irq[index].en_mask;
+	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_EN, intr_en);
+	spin_unlock_irq(&isp_subdev->irq_lock);
 }
 
-static void isp4_resp_interrupt_notify(struct isp4_subdev *isp_subdev, u32 intr_status)
+static void isp4_wake_up_resp_thread(struct isp4_subdev *isp_subdev, u32 index)
 {
-	u32 intr_ack = 0;
-
-	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq_status_mask); i++) {
-		if (intr_status & isp4_irq_status_mask[i]) {
-			disable_irq_nosync(isp_subdev->irq[i]);
-			isp4_wake_up_resp_thread(isp_subdev, i);
-
-			intr_ack |= isp4_irq_ack_mask[i];
-		}
-	}
+	struct isp4sd_thread_handler *thread_ctx = &isp_subdev->fw_resp_thread[index];
 
-	/* clear ISP_SYS interrupts */
-	isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp_subdev), ISP_SYS_INT0_ACK, intr_ack);
+	thread_ctx->resp_ready = true;
+	wake_up_interruptible(&thread_ctx->waitq);
 }
 
 static irqreturn_t isp4_irq_handler(int irq, void *arg)
 {
-	struct isp4_device *isp_dev = arg;
-	struct isp4_subdev *isp_subdev;
-	u32 isp_sys_irq_status;
-	u32 r1;
-
-	isp_subdev = &isp_dev->isp_subdev;
-	/* check ISP_SYS interrupts status */
-	r1 = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp_subdev), ISP_SYS_INT0_STATUS);
-
-	isp_sys_irq_status = r1 & ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
+	struct isp4_subdev *isp_subdev = arg;
+	u32 intr_ack = 0, intr_en = 0, intr_status;
+	int seen = 0;
+
+	/* Get the ISP_SYS interrupt status */
+	intr_status = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_STATUS);
+	intr_status &= ISP4_FW_RESP_RB_IRQ_STATUS_MASK;
+
+	/* Find which ISP_SYS interrupts fired */
+	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
+		if (intr_status & isp4_irq[i].status_mask) {
+			intr_ack |= isp4_irq[i].ack_mask;
+			intr_en |= isp4_irq[i].en_mask;
+			seen |= BIT(i);
+		}
+	}
 
-	isp4_resp_interrupt_notify(isp_subdev, isp_sys_irq_status);
+	/*
+	 * Disable the ISP_SYS interrupts that fired. Must be done before waking
+	 * the response threads, since they re-enable interrupts when finished.
+	 * The lock synchronizes RMW of INT0_EN with isp4_enable_interrupt().
+	 */
+	spin_lock(&isp_subdev->irq_lock);
+	intr_en = isp4hw_rreg(isp_subdev->mmio, ISP_SYS_INT0_EN) & ~intr_en;
+	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_EN, intr_en);
+	spin_unlock(&isp_subdev->irq_lock);
+
+	/*
+	 * Clear the ISP_SYS interrupts. This must be done after the interrupts
+	 * are disabled, so that ISP FW won't flag any new interrupts on these
+	 * streams, and thus we don't need to clear interrupts again before
+	 * re-enabling them in the response thread.
+	 */
+	isp4hw_wreg(isp_subdev->mmio, ISP_SYS_INT0_ACK, intr_ack);
+
+	/* Wake up the response threads */
+	for (int i; (i = ffs(seen)); seen = (seen >> i) << i)
+		isp4_wake_up_resp_thread(isp_subdev, i - 1);
 
 	return IRQ_HANDLED;
 }
@@ -101,7 +122,6 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	if (!isp_dev)
 		return -ENOMEM;
 
-	isp_dev->pdev = pdev;
 	dev->init_name = ISP4_DRV_NAME;
 
 	isp_subdev = &isp_dev->isp_subdev;
@@ -109,15 +129,14 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	if (IS_ERR(isp_subdev->mmio))
 		return dev_err_probe(dev, PTR_ERR(isp_subdev->mmio), "isp ioremap fail\n");
 
-	for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
-		irq[i] = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
+	for (i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
+		irq[i] = platform_get_irq(pdev, isp4_irq[i].rb_int_num);
 		if (irq[i] < 0)
 			return dev_err_probe(dev, irq[i], "fail to get irq %d\n",
-					     isp4_ringbuf_interrupt_num[i]);
+					     isp4_irq[i].rb_int_num);
 
-		irq_set_status_flags(irq[i], IRQ_NOAUTOEN);
-		ret = devm_request_irq(dev, irq[i], isp4_irq_handler, 0, isp4_irq_name[i],
-				       isp_dev);
+		ret = devm_request_irq(dev, irq[i], isp4_irq_handler,
+				       IRQF_NO_AUTOEN, isp4_irq[i].name, isp_subdev);
 		if (ret)
 			return dev_err_probe(dev, ret, "fail to req irq %d\n", irq[i]);
 	}
@@ -132,8 +151,6 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	isp_dev->mdev.dev = dev;
 	media_device_init(&isp_dev->mdev);
 
-	pm_runtime_set_suspended(dev);
-	pm_runtime_enable(dev);
 	/* register v4l2 device */
 	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
 		 "AMD-V4L2-ROOT");
@@ -141,10 +158,13 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "fail register v4l2 device\n");
 
+	pm_runtime_set_suspended(dev);
+	pm_runtime_enable(dev);
+	spin_lock_init(&isp_subdev->irq_lock);
 	ret = isp4sd_init(&isp_dev->isp_subdev, &isp_dev->v4l2_dev, irq);
 	if (ret) {
 		dev_err(dev, "fail init isp4 sub dev %d\n", ret);
-		goto err_unreg_v4l2;
+		goto err_pm_disable;
 	}
 
 	ret = media_create_pad_link(&isp_dev->isp_subdev.sdev.entity,
@@ -170,16 +190,17 @@ static int isp4_capture_probe(struct platform_device *pdev)
 
 err_isp4_deinit:
 	isp4sd_deinit(&isp_dev->isp_subdev);
-err_unreg_v4l2:
+err_pm_disable:
+	pm_runtime_disable(dev);
 	v4l2_device_unregister(&isp_dev->v4l2_dev);
 	media_device_cleanup(&isp_dev->mdev);
-
 	return dev_err_probe(dev, ret, "isp probe fail\n");
 }
 
 static void isp4_capture_remove(struct platform_device *pdev)
 {
 	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
 
 	isp_debugfs_remove(isp_dev);
 
@@ -187,6 +208,7 @@ static void isp4_capture_remove(struct platform_device *pdev)
 	isp4sd_deinit(&isp_dev->isp_subdev);
 	v4l2_device_unregister(&isp_dev->v4l2_dev);
 	media_device_cleanup(&isp_dev->mdev);
+	pm_runtime_disable(dev);
 }
 
 static struct platform_driver isp4_capture_drv = {
diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
index 54cd033326f9..2db6683d6d8b 100644
--- a/drivers/media/platform/amd/isp4/isp4.h
+++ b/drivers/media/platform/amd/isp4/isp4.h
@@ -9,13 +9,12 @@
 #include <drm/amd/isp.h>
 #include "isp4_subdev.h"
 
-#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
-
 struct isp4_device {
 	struct v4l2_device v4l2_dev;
 	struct isp4_subdev isp_subdev;
 	struct media_device mdev;
-	struct platform_device *pdev;
 };
 
+void isp4_intr_enable(struct isp4_subdev *isp_subdev, u32 index, bool enable);
+
 #endif /* _ISP4_H_ */
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.c b/drivers/media/platform/amd/isp4/isp4_debug.c
index 746a92707e54..c6d957ea9132 100644
--- a/drivers/media/platform/amd/isp4/isp4_debug.c
+++ b/drivers/media/platform/amd/isp4/isp4_debug.c
@@ -21,7 +21,7 @@ void isp_debugfs_create(struct isp4_device *isp_dev)
 			    isp_dev->isp_subdev.debugfs_dir,
 			    &isp_dev->isp_subdev.enable_fw_log);
 	isp_dev->isp_subdev.fw_log_output =
-		devm_kzalloc(&isp_dev->pdev->dev,
+		devm_kzalloc(isp_dev->isp_subdev.dev,
 			     ISP4DBG_FW_LOG_RINGBUF_SIZE + 32,
 			     GFP_KERNEL);
 }
@@ -32,23 +32,23 @@ void isp_debugfs_remove(struct isp4_device *isp_dev)
 	isp_dev->isp_subdev.debugfs_dir = NULL;
 }
 
-static u32 isp_fw_fill_rb_log(struct isp4_subdev *isp, u8 *sys, u32 rb_size)
+static u32 isp_fw_fill_rb_log(struct isp4_subdev *isp, void *sys, u32 rb_size)
 {
 	struct isp4_interface *ispif = &isp->ispif;
+	char *buf = isp->fw_log_output;
 	struct device *dev = isp->dev;
-	u8 *buf = isp->fw_log_output;
 	u32 rd_ptr, wr_ptr;
 	u32 total_cnt = 0;
 	u32 offset = 0;
 	u32 cnt;
 
-	if (!sys || rb_size == 0)
+	if (!sys || !rb_size)
 		return 0;
 
 	guard(mutex)(&ispif->isp4if_mutex);
 
-	rd_ptr = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_LOG_RB_RPTR0);
-	wr_ptr = isp4hw_rreg(ISP4_GET_ISP_REG_BASE(isp), ISP_LOG_RB_WPTR0);
+	rd_ptr = isp4hw_rreg(isp->mmio, ISP_LOG_RB_RPTR0);
+	wr_ptr = isp4hw_rreg(isp->mmio, ISP_LOG_RB_WPTR0);
 
 	do {
 		if (wr_ptr > rd_ptr)
@@ -56,23 +56,23 @@ static u32 isp_fw_fill_rb_log(struct isp4_subdev *isp, u8 *sys, u32 rb_size)
 		else if (wr_ptr < rd_ptr)
 			cnt = rb_size - rd_ptr;
 		else
-			goto unlock_and_quit;
+			goto quit;
 
 		if (cnt > rb_size) {
 			dev_err(dev, "fail bad fw log size %u\n", cnt);
-			goto unlock_and_quit;
+			goto quit;
 		}
 
-		memcpy(buf + offset, (u8 *)(sys + rd_ptr), cnt);
+		memcpy(buf + offset, sys + rd_ptr, cnt);
 
 		offset += cnt;
 		total_cnt += cnt;
 		rd_ptr = (rd_ptr + cnt) % rb_size;
 	} while (rd_ptr < wr_ptr);
 
-	isp4hw_wreg(ISP4_GET_ISP_REG_BASE(isp), ISP_LOG_RB_RPTR0, rd_ptr);
+	isp4hw_wreg(isp->mmio, ISP_LOG_RB_RPTR0, rd_ptr);
 
-unlock_and_quit:
+quit:
 	return total_cnt;
 }
 
@@ -159,7 +159,7 @@ char *isp4dbg_get_buf_done_str(u32 status)
 	default:
 		return "Unknown Buf Done Status";
 	}
-};
+}
 
 char *isp4dbg_get_img_fmt_str(int fmt /* enum isp4fw_image_format * */)
 {
@@ -233,7 +233,7 @@ char *isp4dbg_get_cmd_str(u32 cmd)
 		return ISP4DBG_MACRO_2_STR(CMD_ID_ENABLE_OUT_CHAN);
 	default:
 		return "unknown cmd";
-	};
+	}
 }
 
 char *isp4dbg_get_resp_str(u32 cmd)
@@ -245,7 +245,7 @@ char *isp4dbg_get_resp_str(u32 cmd)
 		return ISP4DBG_MACRO_2_STR(RESP_ID_NOTI_FRAME_DONE);
 	default:
 		return "unknown respid";
-	};
+	}
 }
 
 char *isp4dbg_get_if_stream_str(u32 stream /* enum fw_cmd_resp_stream_id */)
diff --git a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
index 39c2265121f9..8ed4ea87ab6d 100644
--- a/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
+++ b/drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
@@ -201,8 +201,7 @@ struct isp4fw_resp_cmd_done {
 };
 
 struct isp4fw_resp_param_package {
-	u32 package_addr_lo;	/* The low 32 bit addr of the pkg address. */
-	u32 package_addr_hi;	/* The high 32 bit addr of the pkg address. */
+	u64 package_addr;	/* The pkg address. */
 	u32 package_size;	/* The total pkg size in bytes. */
 	u32 package_check_sum;	/* The byte sum of the pkg. */
 };
@@ -262,17 +261,10 @@ struct isp4fw_buffer {
 			u32 vmid  : 16;
 		} bit;
 	} vmid_space;
-	u32 buf_base_a_lo;		/* Low address of buffer A */
-	u32 buf_base_a_hi;		/* High address of buffer A */
-	u32 buf_size_a;			/* Buffer size of buffer A */
-
-	u32 buf_base_b_lo;		/* Low address of buffer B */
-	u32 buf_base_b_hi;		/* High address of buffer B */
-	u32 buf_size_b;			/* Buffer size of buffer B */
-
-	u32 buf_base_c_lo;		/* Low address of buffer C */
-	u32 buf_base_c_hi;		/* High address of buffer C */
-	u32 buf_size_c;			/* Buffer size of buffer C */
+	struct {
+		u64 addr;
+		u32 size;
+	} __packed bufs[3];
 };
 
 struct isp4fw_buffer_meta_info {
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index 1852bd56a947..21055af96602 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -12,10 +12,10 @@
 
 #define ISP4IF_FW_RESP_RB_IRQ_EN_MASK \
 	(ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK |  \
-	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK | \
-	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK | \
 	 ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK)
 
+#define ISP4IF_FW_CMD_TIMEOUT (HZ / 2)
+
 struct isp4if_rb_config {
 	const char *name;
 	u32 index;
@@ -204,7 +204,7 @@ static int isp4if_alloc_fw_gpumem(struct isp4_interface *ispif)
 	return -ENOMEM;
 }
 
-static u32 isp4if_compute_check_sum(const u8 *buf, size_t buf_size)
+static u32 isp4if_compute_check_sum(const void *buf, size_t buf_size)
 {
 	const u8 *surplus_ptr;
 	const u32 *buffer;
@@ -235,135 +235,86 @@ void isp4if_clear_cmdq(struct isp4_interface *ispif)
 		kfree(buf_node);
 }
 
-static bool isp4if_is_cmdq_rb_full(struct isp4_interface *ispif, enum isp4if_stream_id cmd_buf_idx)
+static bool isp4if_is_cmdq_rb_full(struct isp4_interface *ispif, enum isp4if_stream_id stream)
 {
-	struct isp4if_rb_config *rb_config;
+	struct isp4if_rb_config *rb_config = &isp4if_cmd_rb_config[stream];
+	u32 rreg = rb_config->reg_rptr, wreg = rb_config->reg_wptr;
+	u32 len = rb_config->val_size;
 	u32 rd_ptr, wr_ptr;
-	u32 new_wr_ptr;
-	u32 rreg;
-	u32 wreg;
-	u32 len;
-
-	rb_config = &isp4if_cmd_rb_config[cmd_buf_idx];
-	rreg = rb_config->reg_rptr;
-	wreg = rb_config->reg_wptr;
-	len = rb_config->val_size;
+	u32 bytes_free;
 
 	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
 	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
 
-	new_wr_ptr = wr_ptr + sizeof(struct isp4fw_cmd);
-
-	if (wr_ptr >= rd_ptr) {
-		if (new_wr_ptr < len) {
-			return false;
-		} else if (new_wr_ptr == len) {
-			if (rd_ptr == 0)
-				return true;
-
-			return false;
-		}
-
-		new_wr_ptr -= len;
-		if (new_wr_ptr < rd_ptr)
-			return false;
-
-		return true;
-	}
-
-	if (new_wr_ptr < rd_ptr)
+	/* Read and write pointers are equal, indicating the ringbuf is empty */
+	if (wr_ptr == rd_ptr)
 		return false;
 
-	return true;
+	if (wr_ptr > rd_ptr)
+		bytes_free = len - (wr_ptr - rd_ptr);
+	else
+		bytes_free = rd_ptr - wr_ptr;
+
+	/*
+	 * Ignore one byte from the bytes free to prevent rd_ptr from equaling
+	 * wr_ptr when the ringbuf is full, because rd_ptr == wr_ptr is supposed
+	 * to indicate that the ringbuf is empty.
+	 */
+	return bytes_free > sizeof(struct isp4fw_cmd);
 }
 
 struct isp4if_cmd_element *isp4if_rm_cmd_from_cmdq(struct isp4_interface *ispif, u32 seq_num,
 						   u32 cmd_id)
 {
 	struct isp4if_cmd_element *buf_node;
-	struct isp4if_cmd_element *tmp_node;
 
-	scoped_guard(spinlock, &ispif->cmdq_lock)
-		list_for_each_entry_safe(buf_node, tmp_node, &ispif->cmdq, list) {
-			if (buf_node->seq_num == seq_num &&
-			    buf_node->cmd_id == cmd_id) {
-				list_del(&buf_node->list);
-				return buf_node;
-			}
+	guard(spinlock)(&ispif->cmdq_lock);
+
+	list_for_each_entry(buf_node, &ispif->cmdq, list) {
+		if (buf_node->seq_num == seq_num &&
+		    buf_node->cmd_id == cmd_id) {
+			list_del(&buf_node->list);
+			return buf_node;
 		}
+	}
 
 	return NULL;
 }
 
+/* Must check that isp4if_is_cmdq_rb_full() == false before calling */
 static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif, enum isp4if_stream_id stream,
-				    struct isp4fw_cmd *cmd)
+				    const struct isp4fw_cmd *cmd)
 {
-	struct isp4if_rb_config *rb_config;
+	struct isp4if_rb_config *rb_config = &isp4if_cmd_rb_config[stream];
+	u32 rreg = rb_config->reg_rptr, wreg = rb_config->reg_wptr;
+	void *mem_sys = rb_config->base_sys_addr;
+	const u32 cmd_sz = sizeof(*cmd);
 	struct device *dev = ispif->dev;
-	u8 *mem_sys;
-	u32 wr_ptr;
-	u32 rd_ptr;
-	u32 rreg;
-	u32 wreg;
-	u32 len;
-
-	rb_config = &isp4if_cmd_rb_config[stream];
-	rreg = rb_config->reg_rptr;
-	wreg = rb_config->reg_wptr;
-	mem_sys = (u8 *)rb_config->base_sys_addr;
-	len = rb_config->val_size;
-
-	if (isp4if_is_cmdq_rb_full(ispif, stream)) {
-		dev_err(dev, "fail no cmdslot %s(%d)\n",
-			isp4dbg_get_if_stream_str(stream), stream);
-		return -EINVAL;
-	}
+	u32 len = rb_config->val_size;
+	const void *src = cmd;
+	u32 rd_ptr, wr_ptr;
+	u32 bytes_to_end;
 
-	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
 	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
-
-	if (rd_ptr > len) {
-		dev_err(dev, "fail %s(%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
-			isp4dbg_get_if_stream_str(stream),
-			stream, rd_ptr, len, wr_ptr);
-		return -EINVAL;
-	}
-
-	if (wr_ptr > len) {
-		dev_err(dev, "fail %s(%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
-			isp4dbg_get_if_stream_str(stream),
-			stream, wr_ptr, len, rd_ptr);
+	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
+	if (rd_ptr >= len || wr_ptr >= len) {
+		dev_err(dev, "rb invalid: stream=%u(%s), rd=%u, wr=%u, len=%u, cmd_sz=%u\n",
+			stream, isp4dbg_get_if_stream_str(stream), rd_ptr, wr_ptr, len, cmd_sz);
 		return -EINVAL;
 	}
 
-	if (wr_ptr < rd_ptr) {
-		memcpy((mem_sys + wr_ptr),
-		       (u8 *)cmd, sizeof(struct isp4fw_cmd));
+	bytes_to_end = len - wr_ptr;
+	if (bytes_to_end >= cmd_sz) {
+		/* FW cmd is just a straight copy to the write pointer */
+		memcpy(mem_sys + wr_ptr, src, cmd_sz);
+		isp4hw_wreg(ispif->mmio, wreg, (wr_ptr + cmd_sz) % len);
 	} else {
-		if ((len - wr_ptr) >= (sizeof(struct isp4fw_cmd))) {
-			memcpy((mem_sys + wr_ptr),
-			       (u8 *)cmd, sizeof(struct isp4fw_cmd));
-		} else {
-			u32 size;
-			u8 *src;
-
-			src = (u8 *)cmd;
-			size = len - wr_ptr;
-
-			memcpy((mem_sys + wr_ptr), src, size);
-
-			src += size;
-			size = sizeof(struct isp4fw_cmd) - size;
-			memcpy((mem_sys), src, size);
-		}
+		/* FW cmd is split because the ringbuf needs to wrap around */
+		memcpy(mem_sys + wr_ptr, src, bytes_to_end);
+		memcpy(mem_sys, src + bytes_to_end, cmd_sz - bytes_to_end);
+		isp4hw_wreg(ispif->mmio, wreg, cmd_sz - bytes_to_end);
 	}
 
-	wr_ptr += sizeof(struct isp4fw_cmd);
-	if (wr_ptr >= len)
-		wr_ptr -= len;
-
-	isp4hw_wreg(ispif->mmio, wreg, wr_ptr);
-
 	return 0;
 }
 
@@ -372,17 +323,14 @@ static inline enum isp4if_stream_id isp4if_get_fw_stream(u32 cmd_id)
 	return ISP4IF_STREAM_ID_1;
 }
 
-static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *package,
-			      u32 package_size, struct completion *cmd_complete, u32 *seq)
+static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, const void *package,
+			      u32 package_size, bool sync)
 {
 	enum isp4if_stream_id stream = isp4if_get_fw_stream(cmd_id);
-	struct isp4if_cmd_element *cmd_ele = NULL;
-	struct isp4if_rb_config *rb_config;
+	struct isp4if_cmd_element *ele = NULL;
 	struct device *dev = ispif->dev;
-	struct isp4fw_cmd cmd = {};
+	struct isp4fw_cmd cmd;
 	u32 seq_num;
-	u32 rreg;
-	u32 wreg;
 	int ret;
 
 	if (package_size > sizeof(cmd.cmd_param)) {
@@ -391,32 +339,39 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *pa
 		return -EINVAL;
 	}
 
-	/*
-	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
-	 * zeroed, since this may not guarantee on all compilers.
-	 */
-	memset(&cmd, 0, sizeof(cmd));
-	rb_config = &isp4if_resp_rb_config[stream];
-	rreg = rb_config->reg_rptr;
-	wreg = rb_config->reg_wptr;
+	/* Allocate the sync command object early and outside of the lock */
+	if (sync) {
+		ele = kmalloc(sizeof(*ele), GFP_KERNEL);
+		if (!ele)
+			return -ENOMEM;
 
-	guard(mutex)(&ispif->isp4if_mutex);
+		/* Get two references: one for the resp thread, one for us */
+		atomic_set(&ele->refcnt, 2);
+		init_completion(&ele->cmd_done);
+	}
 
-	ret = read_poll_timeout(isp4if_is_cmdq_rb_full, ret, !ret, ISP4IF_MAX_SLEEP_TIME * 1000,
-				ISP4IF_MAX_SLEEP_COUNT * ISP4IF_MAX_SLEEP_TIME * 1000, false,
-				ispif, stream);
+	guard(mutex)(&ispif->isp4if_mutex);
 
+	ret = read_poll_timeout(isp4if_is_cmdq_rb_full, ret, !ret, ISP4IF_RB_FULL_SLEEP_US,
+				ISP4IF_RB_FULL_TIMEOUT_US, false, ispif, stream);
 	if (ret) {
-		u32 rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
-		u32 wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
+		struct isp4if_rb_config *rb_config = &isp4if_resp_rb_config[stream];
+		u32 rd_ptr = isp4hw_rreg(ispif->mmio, rb_config->reg_rptr);
+		u32 wr_ptr = isp4hw_rreg(ispif->mmio, rb_config->reg_wptr);
 
 		dev_err(dev,
 			"failed to get free cmdq slot, stream %s(%d),rd %u, wr %u\n",
 			isp4dbg_get_if_stream_str(stream),
 			stream, rd_ptr, wr_ptr);
-		return -ETIMEDOUT;
+		ret = -ETIMEDOUT;
+		goto free_ele;
 	}
 
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this is not guaranteed on all compilers.
+	 */
+	memset(&cmd, 0, sizeof(cmd));
 	cmd.cmd_id = cmd_id;
 	switch (stream) {
 	case ISP4IF_STREAM_ID_GLOBAL:
@@ -427,7 +382,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *pa
 		break;
 	default:
 		dev_err(dev, "fail bad stream id %d\n", stream);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto free_ele;
 	}
 
 	if (package && package_size)
@@ -435,39 +391,53 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id, void *pa
 
 	seq_num = ispif->host2fw_seq_num++;
 	cmd.cmd_seq_num = seq_num;
-	cmd.cmd_check_sum =
-		isp4if_compute_check_sum((u8 *)&cmd, sizeof(cmd) - sizeof(u32));
+	cmd.cmd_check_sum = isp4if_compute_check_sum(&cmd, sizeof(cmd) - sizeof(u32));
 
-	if (seq)
-		*seq = seq_num;
 	/*
 	 * only append the fw cmd to queue when its response needs to be waited for,
 	 * currently there are only two such commands, disable channel and stop stream
 	 * which are only sent after close camera
 	 */
-	if (cmd_complete) {
-		cmd_ele = kmalloc(sizeof(*cmd_ele), GFP_KERNEL);
-		if (!cmd_ele)
-			return -ENOMEM;
-
-		cmd_ele->seq_num = seq_num;
-		cmd_ele->cmd_id = cmd_id;
-		cmd_ele->cmd_complete = cmd_complete;
-
+	if (ele) {
+		ele->seq_num = seq_num;
+		ele->cmd_id = cmd_id;
 		scoped_guard(spinlock, &ispif->cmdq_lock)
-			list_add_tail(&cmd_ele->list, &ispif->cmdq);
+			list_add_tail(&ele->list, &ispif->cmdq);
 	}
 
 	ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
 	if (ret) {
-		dev_err(dev, "fail for insert_isp_fw_cmd camId %s(0x%08x)\n",
+		dev_err(dev, "fail for insert_isp_fw_cmd cmd_id %s(0x%08x)\n",
 			isp4dbg_get_cmd_str(cmd_id), cmd_id);
-		if (cmd_ele) {
-			cmd_ele = isp4if_rm_cmd_from_cmdq(ispif, seq_num, cmd_id);
-			kfree(cmd_ele);
+		goto err_dequeue_ele;
+	}
+
+	if (ele) {
+		ret = wait_for_completion_timeout(&ele->cmd_done, ISP4IF_FW_CMD_TIMEOUT);
+		if (!ret) {
+			ret = -ETIMEDOUT;
+			goto err_dequeue_ele;
 		}
+		ret = 0;
+		goto put_ele_ref;
 	}
 
+	return 0;
+
+err_dequeue_ele:
+	/*
+	 * Try to remove the command from the queue. If that fails, then it
+	 * means the response thread is currently using the object, and we need
+	 * to use the refcount to avoid a use-after-free by either side.
+	 */
+	if (ele && isp4if_rm_cmd_from_cmdq(ispif, seq_num, cmd_id))
+		goto free_ele;
+put_ele_ref:
+	/* Don't free the command if we didn't put the last reference */
+	if (ele && atomic_dec_return(&ele->refcnt))
+		ele = NULL;
+free_ele:
+	kfree(ele);
 	return ret;
 }
 
@@ -477,51 +447,31 @@ static int isp4if_send_buffer(struct isp4_interface *ispif, struct isp4if_img_bu
 
 	/*
 	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
-	 * zeroed, since this may not guarantee on all compilers.
+	 * zeroed, since this is not guaranteed on all compilers.
 	 */
 	memset(&cmd, 0, sizeof(cmd));
 	cmd.buffer_type = BUFFER_TYPE_PREVIEW;
-	cmd.buffer.vmid_space.bit.vmid = 0;
 	cmd.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
-	isp4if_split_addr64(buf_info->planes[0].mc_addr,
-			    &cmd.buffer.buf_base_a_lo,
-			    &cmd.buffer.buf_base_a_hi);
-	cmd.buffer.buf_size_a = buf_info->planes[0].len;
-
-	isp4if_split_addr64(buf_info->planes[1].mc_addr,
-			    &cmd.buffer.buf_base_b_lo,
-			    &cmd.buffer.buf_base_b_hi);
-	cmd.buffer.buf_size_b = buf_info->planes[1].len;
-
-	isp4if_split_addr64(buf_info->planes[2].mc_addr,
-			    &cmd.buffer.buf_base_c_lo,
-			    &cmd.buffer.buf_base_c_hi);
-	cmd.buffer.buf_size_c = buf_info->planes[2].len;
-
-	return isp4if_send_fw_cmd(ispif, CMD_ID_SEND_BUFFER, &cmd, sizeof(cmd), NULL, NULL);
+	for (int i = 0; i < ARRAY_SIZE(buf_info->planes); i++) {
+		cmd.buffer.bufs[i].addr = buf_info->planes[i].mc_addr;
+		cmd.buffer.bufs[i].size = buf_info->planes[i].len;
+	}
+
+	return isp4if_send_fw_cmd(ispif, CMD_ID_SEND_BUFFER, &cmd, sizeof(cmd), false);
 }
 
 static void isp4if_init_rb_config(struct isp4_interface *ispif, struct isp4if_rb_config *rb_config)
 {
-	u32 lo;
-	u32 hi;
-
-	isp4if_split_addr64(rb_config->base_mc_addr, &lo, &hi);
-
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
-		    rb_config->reg_rptr, 0x0);
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
-		    rb_config->reg_wptr, 0x0);
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
-		    rb_config->reg_base_lo, lo);
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
-		    rb_config->reg_base_hi, hi);
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
-		    rb_config->reg_size, rb_config->val_size);
+	isp4hw_wreg(ispif->mmio, rb_config->reg_rptr, 0x0);
+	isp4hw_wreg(ispif->mmio, rb_config->reg_wptr, 0x0);
+	isp4hw_wreg(ispif->mmio, rb_config->reg_base_lo, rb_config->base_mc_addr);
+	isp4hw_wreg(ispif->mmio, rb_config->reg_base_hi, rb_config->base_mc_addr >> 32);
+	isp4hw_wreg(ispif->mmio, rb_config->reg_size, rb_config->val_size);
 }
 
 static int isp4if_fw_init(struct isp4_interface *ispif)
 {
+	u32 aligned_rb_chunk_size = ISP4IF_RB_PMBMAP_MEM_CHUNK & 0xffffffc0;
 	struct isp4if_rb_config *rb_config;
 	u32 offset;
 	int i;
@@ -529,12 +479,11 @@ static int isp4if_fw_init(struct isp4_interface *ispif)
 	/* initialize CMD_RB streams */
 	for (i = 0; i < ISP4IF_STREAM_ID_MAX; i++) {
 		rb_config = (isp4if_cmd_rb_config + i);
-		offset = ispif->aligned_rb_chunk_size *
-			 (rb_config->index + ispif->cmd_rb_base_index);
+		offset = aligned_rb_chunk_size * rb_config->index;
 
 		rb_config->val_size = ISP4IF_FW_CMD_BUF_SIZE;
 		rb_config->base_sys_addr =
-			(u8 *)ispif->fw_cmd_resp_buf->sys_addr + offset;
+			ispif->fw_cmd_resp_buf->sys_addr + offset;
 		rb_config->base_mc_addr =
 			ispif->fw_cmd_resp_buf->gpu_mc_addr + offset;
 
@@ -544,12 +493,12 @@ static int isp4if_fw_init(struct isp4_interface *ispif)
 	/* initialize RESP_RB streams */
 	for (i = 0; i < ISP4IF_STREAM_ID_MAX; i++) {
 		rb_config = (isp4if_resp_rb_config + i);
-		offset = ispif->aligned_rb_chunk_size *
-			 (rb_config->index + ispif->resp_rb_base_index);
+		offset = aligned_rb_chunk_size *
+			 (rb_config->index + ISP4IF_RESP_CHAN_TO_RB_OFFSET - 1);
 
 		rb_config->val_size = ISP4IF_FW_CMD_BUF_SIZE;
 		rb_config->base_sys_addr =
-			(u8 *)ispif->fw_cmd_resp_buf->sys_addr + offset;
+			ispif->fw_cmd_resp_buf->sys_addr + offset;
 		rb_config->base_mc_addr =
 			ispif->fw_cmd_resp_buf->gpu_mc_addr + offset;
 
@@ -577,7 +526,7 @@ static int isp4if_wait_fw_ready(struct isp4_interface *ispif, u32 isp_status_add
 	/* wait for FW initialize done! */
 	if (!read_poll_timeout(isp4hw_rreg, reg_val, reg_val & ISP_STATUS__CCPU_REPORT_MASK,
 			       interval_ms * 1000, timeout_ms * 1000, false,
-			       GET_ISP4IF_REG_BASE(ispif), isp_status_addr))
+			       ispif->mmio, isp_status_addr))
 		return 0;
 
 	dev_err(dev, "ISP CCPU FW boot failed\n");
@@ -589,30 +538,30 @@ static void isp4if_enable_ccpu(struct isp4_interface *ispif)
 {
 	u32 reg_val;
 
-	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET);
+	reg_val = isp4hw_rreg(ispif->mmio, ISP_SOFT_RESET);
 	reg_val &= (~ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK);
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET, reg_val);
+	isp4hw_wreg(ispif->mmio, ISP_SOFT_RESET, reg_val);
 
 	usleep_range(100, 150);
 
-	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL);
+	reg_val = isp4hw_rreg(ispif->mmio, ISP_CCPU_CNTL);
 	reg_val &= (~ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK);
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL, reg_val);
+	isp4hw_wreg(ispif->mmio, ISP_CCPU_CNTL, reg_val);
 }
 
 static void isp4if_disable_ccpu(struct isp4_interface *ispif)
 {
 	u32 reg_val;
 
-	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL);
+	reg_val = isp4hw_rreg(ispif->mmio, ISP_CCPU_CNTL);
 	reg_val |= ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK;
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_CCPU_CNTL, reg_val);
+	isp4hw_wreg(ispif->mmio, ISP_CCPU_CNTL, reg_val);
 
 	usleep_range(100, 150);
 
-	reg_val = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET);
+	reg_val = isp4hw_rreg(ispif->mmio, ISP_SOFT_RESET);
 	reg_val |= ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK;
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SOFT_RESET, reg_val);
+	isp4hw_wreg(ispif->mmio, ISP_SOFT_RESET, reg_val);
 }
 
 static int isp4if_fw_boot(struct isp4_interface *ispif)
@@ -629,7 +578,7 @@ static int isp4if_fw_boot(struct isp4_interface *ispif)
 	isp4if_fw_init(ispif);
 
 	/* clear ccpu status */
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_STATUS, 0x0);
+	isp4hw_wreg(ispif->mmio, ISP_STATUS, 0x0);
 
 	isp4if_enable_ccpu(ispif);
 
@@ -639,8 +588,7 @@ static int isp4if_fw_boot(struct isp4_interface *ispif)
 	}
 
 	/* enable interrupts */
-	isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif), ISP_SYS_INT0_EN,
-		    ISP4IF_FW_RESP_RB_IRQ_EN_MASK);
+	isp4hw_wreg(ispif->mmio, ISP_SYS_INT0_EN, ISP4IF_FW_RESP_RB_IRQ_EN_MASK);
 
 	ispif->status = ISP4IF_STATUS_FW_RUNNING;
 
@@ -649,165 +597,74 @@ static int isp4if_fw_boot(struct isp4_interface *ispif)
 	return 0;
 }
 
-int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream, void *resp)
+int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
+		    struct isp4fw_resp *resp)
 {
-	struct isp4fw_resp *response = resp;
-	struct isp4if_rb_config *rb_config;
+	struct isp4if_rb_config *rb_config = &isp4if_resp_rb_config[stream];
+	u32 rreg = rb_config->reg_rptr, wreg = rb_config->reg_wptr;
+	void *mem_sys = rb_config->base_sys_addr;
+	const u32 resp_sz = sizeof(*resp);
 	struct device *dev = ispif->dev;
-	u32 rd_ptr_dbg;
-	u32 wr_ptr_dbg;
-	void *mem_sys;
-	u64 mem_addr;
+	u32 len = rb_config->val_size;
+	u32 rd_ptr, wr_ptr;
+	u32 bytes_to_end;
+	void *dst = resp;
 	u32 checksum;
-	u32 rd_ptr;
-	u32 wr_ptr;
-	u32 rreg;
-	u32 wreg;
-	u32 len;
-
-	rb_config = &isp4if_resp_rb_config[stream];
-	rreg = rb_config->reg_rptr;
-	wreg = rb_config->reg_wptr;
-	mem_sys = rb_config->base_sys_addr;
-	mem_addr = rb_config->base_mc_addr;
-	len = rb_config->val_size;
-
-	rd_ptr = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), rreg);
-	wr_ptr = isp4hw_rreg(GET_ISP4IF_REG_BASE(ispif), wreg);
-	rd_ptr_dbg = rd_ptr;
-	wr_ptr_dbg = wr_ptr;
-
-	if (rd_ptr > len) {
-		dev_err(dev, "fail %s(%u),rd_ptr %u(should<=%u),wr_ptr %u\n",
-			isp4dbg_get_if_stream_str(stream),
-			stream, rd_ptr, len, wr_ptr);
-		return -EINVAL;
-	}
 
-	if (wr_ptr > len) {
-		dev_err(dev, "fail %s(%u),wr_ptr %u(should<=%u), rd_ptr %u\n",
-			isp4dbg_get_if_stream_str(stream),
-			stream, wr_ptr, len, rd_ptr);
-		return -EINVAL;
-	}
+	rd_ptr = isp4hw_rreg(ispif->mmio, rreg);
+	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
+	if (rd_ptr >= len || wr_ptr >= len)
+		goto err_rb_invalid;
 
-	if (rd_ptr < wr_ptr) {
-		if ((wr_ptr - rd_ptr) >= (sizeof(struct isp4fw_resp))) {
-			memcpy((u8 *)response, (u8 *)mem_sys + rd_ptr,
-			       sizeof(struct isp4fw_resp));
-
-			rd_ptr += sizeof(struct isp4fw_resp);
-			if (rd_ptr < len) {
-				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
-					    rreg, rd_ptr);
-			} else {
-				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
-					isp4dbg_get_if_stream_str(stream),
-					stream, rd_ptr, len, wr_ptr);
-				return -EINVAL;
-			}
-
-		} else {
-			dev_err(dev, "sth wrong with wptr and rptr\n");
-			return -EINVAL;
-		}
-	} else if (rd_ptr > wr_ptr) {
-		u32 size;
-		u8 *dst;
-
-		dst = (u8 *)response;
-
-		size = len - rd_ptr;
-		if (size > sizeof(struct isp4fw_resp)) {
-			mem_addr += rd_ptr;
-			memcpy((u8 *)response,
-			       (u8 *)(mem_sys) + rd_ptr,
-			       sizeof(struct isp4fw_resp));
-			rd_ptr += sizeof(struct isp4fw_resp);
-			if (rd_ptr < len) {
-				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
-					    rreg, rd_ptr);
-			} else {
-				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
-					isp4dbg_get_if_stream_str(stream),
-					stream, rd_ptr, len, wr_ptr);
-				return -EINVAL;
-			}
-
-		} else {
-			if ((size + wr_ptr) < (sizeof(struct isp4fw_resp))) {
-				dev_err(dev, "sth wrong with wptr and rptr1\n");
-				return -EINVAL;
-			}
-
-			memcpy(dst, (u8 *)(mem_sys) + rd_ptr, size);
-
-			dst += size;
-			size = sizeof(struct isp4fw_resp) - size;
-			if (size)
-				memcpy(dst, (u8 *)(mem_sys), size);
-			rd_ptr = size;
-			if (rd_ptr < len) {
-				isp4hw_wreg(GET_ISP4IF_REG_BASE(ispif),
-					    rreg, rd_ptr);
-			} else {
-				dev_err(dev, "%s(%u),rd %u(should<=%u),wr %u\n",
-					isp4dbg_get_if_stream_str(stream),
-					stream, rd_ptr, len, wr_ptr);
-				return -EINVAL;
-			}
-		}
+	/* Read and write pointers are equal, indicating the ringbuf is empty */
+	if (rd_ptr == wr_ptr)
+		return -ENODATA;
+
+	bytes_to_end = len - rd_ptr;
+	if (bytes_to_end >= resp_sz) {
+		/* FW response is just a straight copy from the read pointer */
+		if (wr_ptr > rd_ptr && wr_ptr - rd_ptr < resp_sz)
+			goto err_rb_invalid;
+
+		memcpy(dst, mem_sys + rd_ptr, resp_sz);
+		isp4hw_wreg(ispif->mmio, rreg, (rd_ptr + resp_sz) % len);
 	} else {
-		return -ETIME;
-	}
+		/* FW response is split because the ringbuf wrapped around */
+		if (wr_ptr > rd_ptr || wr_ptr < resp_sz - bytes_to_end)
+			goto err_rb_invalid;
 
-	checksum = isp4if_compute_check_sum((u8 *)response,
-					    sizeof(struct isp4fw_resp) - sizeof(u32));
+		memcpy(dst, mem_sys + rd_ptr, bytes_to_end);
+		memcpy(dst + bytes_to_end, mem_sys, resp_sz - bytes_to_end);
+		isp4hw_wreg(ispif->mmio, rreg, resp_sz - bytes_to_end);
+	}
 
-	if (checksum != response->resp_check_sum) {
+	checksum = isp4if_compute_check_sum(resp, resp_sz - sizeof(u32));
+	if (checksum != resp->resp_check_sum) {
 		dev_err(dev, "resp checksum 0x%x,should 0x%x,rptr %u,wptr %u\n",
-			checksum, response->resp_check_sum, rd_ptr_dbg, wr_ptr_dbg);
-
+			checksum, resp->resp_check_sum, rd_ptr, wr_ptr);
 		dev_err(dev, "%s(%u), seqNo %u, resp_id %s(0x%x)\n",
-			isp4dbg_get_if_stream_str(stream), stream, response->resp_seq_num,
-			isp4dbg_get_resp_str(response->resp_id), response->resp_id);
-
+			isp4dbg_get_if_stream_str(stream), stream, resp->resp_seq_num,
+			isp4dbg_get_resp_str(resp->resp_id), resp->resp_id);
 		return -EINVAL;
 	}
 
 	return 0;
+
+err_rb_invalid:
+	dev_err(dev, "rb invalid: stream=%u(%s), rd=%u, wr=%u, len=%u, resp_sz=%u\n",
+		stream, isp4dbg_get_if_stream_str(stream), rd_ptr, wr_ptr, len, resp_sz);
+	return -EINVAL;
 }
 
-int isp4if_send_command(struct isp4_interface *ispif, u32 cmd_id, void *package, u32 package_size)
+int isp4if_send_command(struct isp4_interface *ispif, u32 cmd_id, const void *package, u32 package_size)
 {
-	return isp4if_send_fw_cmd(ispif, cmd_id, package, package_size, NULL, NULL);
+	return isp4if_send_fw_cmd(ispif, cmd_id, package, package_size, false);
 }
 
-int isp4if_send_command_sync(struct isp4_interface *ispif, u32 cmd_id, void *package,
-			     u32 package_size, u32 timeout)
+int isp4if_send_command_sync(struct isp4_interface *ispif, u32 cmd_id, const void *package,
+			     u32 package_size)
 {
-	DECLARE_COMPLETION_ONSTACK(cmd_completion);
-	struct device *dev = ispif->dev;
-	int ret;
-	u32 seq;
-
-	ret = isp4if_send_fw_cmd(ispif, cmd_id, package, package_size, &cmd_completion, &seq);
-
-	if (ret) {
-		dev_err(dev, "send fw cmd fail %d\n", ret);
-		return ret;
-	}
-
-	ret = wait_for_completion_timeout(&cmd_completion, msecs_to_jiffies(timeout));
-	if (ret == 0) {
-		struct isp4if_cmd_element *ele;
-
-		ele = isp4if_rm_cmd_from_cmdq(ispif, seq, cmd_id);
-		kfree(ele);
-		return -ETIMEDOUT;
-	}
-
-	return 0;
+	return isp4if_send_fw_cmd(ispif, cmd_id, package, package_size, true);
 }
 
 void isp4if_clear_bufq(struct isp4_interface *ispif)
@@ -842,8 +699,9 @@ struct isp4if_img_buf_node *isp4if_dequeue_buffer(struct isp4_interface *ispif)
 {
 	struct isp4if_img_buf_node *buf_node;
 
-	scoped_guard(spinlock, &ispif->bufq_lock)
-		buf_node = list_first_entry_or_null(&ispif->bufq, typeof(*buf_node), node);
+	guard(spinlock)(&ispif->bufq_lock);
+
+	buf_node = list_first_entry_or_null(&ispif->bufq, typeof(*buf_node), node);
 	if (buf_node)
 		list_del(&buf_node->node);
 
@@ -903,14 +761,10 @@ int isp4if_deinit(struct isp4_interface *ispif)
 	return 0;
 }
 
-int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmip)
+int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmio)
 {
 	ispif->dev = dev;
-	ispif->mmio = isp_mmip;
-
-	ispif->cmd_rb_base_index = 0;
-	ispif->resp_rb_base_index = ISP4IF_RESP_CHAN_TO_RB_OFFSET - 1;
-	ispif->aligned_rb_chunk_size = ISP4IF_RB_PMBMAP_MEM_CHUNK & 0xffffffc0;
+	ispif->mmio = isp_mmio;
 
 	spin_lock_init(&ispif->cmdq_lock); /* used for cmdq access */
 	spin_lock_init(&ispif->bufq_lock); /* used for bufq access */
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.h b/drivers/media/platform/amd/isp4/isp4_interface.h
index 688a4ea84dc6..d9113a9cc10d 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.h
+++ b/drivers/media/platform/amd/isp4/isp4_interface.h
@@ -11,28 +11,24 @@
 #include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
-#define ISP4IF_RB_MAX (25)
-#define ISP4IF_RESP_CHAN_TO_RB_OFFSET (9)
-#define ISP4IF_RB_PMBMAP_MEM_SIZE (16 * 1024 * 1024 - 1)
-#define ISP4IF_RB_PMBMAP_MEM_CHUNK (ISP4IF_RB_PMBMAP_MEM_SIZE \
-	/ (ISP4IF_RB_MAX - 1))
-#define ISP4IF_HOST2FW_COMMAND_SIZE (sizeof(struct isp4fw_cmd))
-#define ISP4IF_FW_CMD_BUF_COUNT 4
-#define ISP4IF_FW_RESP_BUF_COUNT 4
-#define ISP4IF_MAX_NUM_HOST2FW_COMMAND (40)
-#define ISP4IF_FW_CMD_BUF_SIZE (ISP4IF_MAX_NUM_HOST2FW_COMMAND \
-	* ISP4IF_HOST2FW_COMMAND_SIZE)
-#define ISP4IF_MAX_SLEEP_COUNT (10)
-#define ISP4IF_MAX_SLEEP_TIME (33)
+struct isp4fw_resp;
+
+#define ISP4IF_RB_MAX 25
+#define ISP4IF_RESP_CHAN_TO_RB_OFFSET 9
+#define ISP4IF_RB_PMBMAP_MEM_SIZE (SZ_16M - 1)
+#define ISP4IF_RB_PMBMAP_MEM_CHUNK \
+	(ISP4IF_RB_PMBMAP_MEM_SIZE / (ISP4IF_RB_MAX - 1))
+#define ISP4IF_HOST2FW_COMMAND_SIZE sizeof(struct isp4fw_cmd)
+#define ISP4IF_MAX_NUM_HOST2FW_COMMAND 40
+#define ISP4IF_FW_CMD_BUF_SIZE \
+	(ISP4IF_MAX_NUM_HOST2FW_COMMAND * ISP4IF_HOST2FW_COMMAND_SIZE)
+#define ISP4IF_RB_FULL_SLEEP_US (33 * USEC_PER_MSEC)
+#define ISP4IF_RB_FULL_TIMEOUT_US (10 * ISP4IF_RB_FULL_SLEEP_US)
 
 #define ISP4IF_META_INFO_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
 #define ISP4IF_MAX_STREAM_BUF_COUNT 8
 
-#define ISP4IF_FW_LOG_RINGBUF_SIZE (2 * 1024 * 1024)
-
-#define ISP4IF_MAX_CMD_RESPONSE_BUF_SIZE (4 * 1024)
-
-#define GET_ISP4IF_REG_BASE(ispif) (((ispif))->mmio)
+#define ISP4IF_FW_LOG_RINGBUF_SIZE SZ_2M
 
 enum isp4if_stream_id {
 	ISP4IF_STREAM_ID_GLOBAL = 0,
@@ -48,10 +44,10 @@ enum isp4if_status {
 };
 
 struct isp4if_gpu_mem_info {
-	u64	mem_size;
-	u64	gpu_mc_addr;
-	void	*sys_addr;
-	void	*mem_handle;
+	u64 mem_size;
+	u64 gpu_mc_addr;
+	void *sys_addr;
+	void *mem_handle;
 };
 
 struct isp4if_img_buf_info {
@@ -71,7 +67,8 @@ struct isp4if_cmd_element {
 	struct list_head list;
 	u32 seq_num;
 	u32 cmd_id;
-	struct completion *cmd_complete;
+	struct completion cmd_done;
+	atomic_t refcnt;
 };
 
 struct isp4_interface {
@@ -88,11 +85,6 @@ struct isp4_interface {
 	enum isp4if_status status;
 	u32 host2fw_seq_num;
 
-	/* FW ring buffer configs */
-	u32 cmd_rb_base_index;
-	u32 resp_rb_base_index;
-	u32 aligned_rb_chunk_size;
-
 	/* ISP fw buffers */
 	struct isp4if_gpu_mem_info *fw_log_buf;
 	struct isp4if_gpu_mem_info *fw_cmd_resp_buf;
@@ -100,26 +92,14 @@ struct isp4_interface {
 	struct isp4if_gpu_mem_info *meta_info_buf[ISP4IF_MAX_STREAM_BUF_COUNT];
 };
 
-static inline void isp4if_split_addr64(u64 addr, u32 *lo, u32 *hi)
-{
-	if (lo)
-		*lo = addr & 0xffffffff;
-	if (hi)
-		*hi = addr >> 32;
-}
-
-static inline u64 isp4if_join_addr64(u32 lo, u32 hi)
-{
-	return (((u64)hi) << 32) | (u64)lo;
-}
-
-int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream, void *response);
+int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
+		    struct isp4fw_resp *resp);
 
-int isp4if_send_command(struct isp4_interface *ispif, u32 cmd_id, void *package,
+int isp4if_send_command(struct isp4_interface *ispif, u32 cmd_id, const void *package,
 			u32 package_size);
 
-int isp4if_send_command_sync(struct isp4_interface *ispif, u32 cmd_id, void *package,
-			     u32 package_size, u32 timeout);
+int isp4if_send_command_sync(struct isp4_interface *ispif, u32 cmd_id, const void *package,
+			     u32 package_size);
 
 struct isp4if_cmd_element *isp4if_rm_cmd_from_cmdq(struct isp4_interface *ispif, u32 seq_num,
 						   u32 cmd_id);
@@ -142,6 +122,6 @@ int isp4if_start(struct isp4_interface *ispif);
 
 int isp4if_deinit(struct isp4_interface *ispif);
 
-int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmip);
+int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmio);
 
 #endif /* _ISP4_INTERFACE_H_ */
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 17480ae5150d..1ae7fe3b11e9 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -9,16 +9,13 @@
 #include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_interface.h"
-#include "isp4_subdev.h"
+#include "isp4.h"
 
-#define ISP4SD_MAX_CMD_RESP_BUF_SIZE (4 * 1024)
 #define ISP4SD_MIN_BUF_CNT_BEF_START_STREAM 4
 
 #define ISP4SD_PERFORMANCE_STATE_LOW 0
 #define ISP4SD_PERFORMANCE_STATE_HIGH 1
 
-#define ISP4SD_FW_CMD_TIMEOUT_IN_MS  500
-
 /* align 32KB */
 #define ISP4SD_META_BUF_SIZE ALIGN(sizeof(struct isp4fw_meta_info), 0x8000)
 
@@ -55,34 +52,29 @@ static int isp4sd_setup_fw_mem_pool(struct isp4_subdev *isp_subdev)
 
 	/*
 	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
-	 * zeroed, since this may not guarantee on all compilers.
+	 * zeroed, since this is not guaranteed on all compilers.
 	 */
 	memset(&buf_type, 0, sizeof(buf_type));
 	buf_type.buffer_type = BUFFER_TYPE_MEM_POOL;
-	buf_type.buffer.buf_tags = 0;
-	buf_type.buffer.vmid_space.bit.vmid = 0;
 	buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
-	isp4if_split_addr64(ispif->fw_mem_pool->gpu_mc_addr,
-			    &buf_type.buffer.buf_base_a_lo,
-			    &buf_type.buffer.buf_base_a_hi);
-	buf_type.buffer.buf_size_a = (u32)ispif->fw_mem_pool->mem_size;
+	buf_type.buffer.bufs[0].addr = ispif->fw_mem_pool->gpu_mc_addr;
+	buf_type.buffer.bufs[0].size = ispif->fw_mem_pool->mem_size;
 
 	ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
 				  &buf_type, sizeof(buf_type));
 	if (ret) {
 		dev_err(dev, "send fw mem pool 0x%llx(%u) fail %d\n",
-			ispif->fw_mem_pool->gpu_mc_addr,
-			buf_type.buffer.buf_size_a,
+			buf_type.buffer.bufs[0].addr,
+			buf_type.buffer.bufs[0].size,
 			ret);
 		return ret;
 	}
 
 	dev_dbg(dev, "send fw mem pool 0x%llx(%u) suc\n",
-		ispif->fw_mem_pool->gpu_mc_addr,
-		buf_type.buffer.buf_size_a);
+		buf_type.buffer.bufs[0].addr, buf_type.buffer.bufs[0].size);
 
 	return 0;
-};
+}
 
 static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
 {
@@ -92,7 +84,7 @@ static int isp4sd_set_stream_path(struct isp4_subdev *isp_subdev)
 
 	/*
 	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
-	 * zeroed, since this may not guarantee on all compilers.
+	 * zeroed, since this is not guaranteed on all compilers.
 	 */
 	memset(&cmd, 0, sizeof(cmd));
 	cmd.stream_cfg.mipi_pipe_path_cfg.isp4fw_sensor_id = SENSOR_ID_ON_MIPI0;
@@ -113,35 +105,29 @@ static int isp4sd_send_meta_buf(struct isp4_subdev *isp_subdev)
 {
 	struct isp4_interface *ispif = &isp_subdev->ispif;
 	struct isp4fw_cmd_send_buffer buf_type;
-	struct isp4sd_sensor_info *sensor_info;
 	struct device *dev = isp_subdev->dev;
-	u32 i;
+	int i;
 
 	/*
 	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
-	 * zeroed, since this may not guarantee on all compilers.
+	 * zeroed, since this is not guaranteed on all compilers.
 	 */
 	memset(&buf_type, 0, sizeof(buf_type));
-	sensor_info = &isp_subdev->sensor_info;
 	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
+		struct isp4if_gpu_mem_info *meta_info_buf =
+				isp_subdev->ispif.meta_info_buf[i];
 		int ret;
 
-		if (!isp_subdev->ispif.meta_info_buf[i]) {
+		if (!meta_info_buf) {
 			dev_err(dev, "fail for no meta info buf(%u)\n", i);
 			return -ENOMEM;
 		}
 		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
-		buf_type.buffer.buf_tags = 0;
-		buf_type.buffer.vmid_space.bit.vmid = 0;
 		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
-		isp4if_split_addr64(isp_subdev->ispif.meta_info_buf[i]->gpu_mc_addr,
-				    &buf_type.buffer.buf_base_a_lo,
-				    &buf_type.buffer.buf_base_a_hi);
-		buf_type.buffer.buf_size_a =
-			(u32)isp_subdev->ispif.meta_info_buf[i]->mem_size;
+		buf_type.buffer.bufs[0].addr = meta_info_buf->gpu_mc_addr;
+		buf_type.buffer.bufs[0].size = meta_info_buf->mem_size;
 		ret = isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
-					  &buf_type,
-					  sizeof(buf_type));
+					  &buf_type, sizeof(buf_type));
 		if (ret) {
 			dev_err(dev, "send meta info(%u) fail\n", i);
 			return ret;
@@ -158,7 +144,6 @@ static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
 {
 	struct device *dev = isp_subdev->dev;
 	struct v4l2_mbus_framefmt *format;
-	bool ret;
 
 	format = v4l2_subdev_state_get_format(state, pad, 0);
 	if (!format) {
@@ -173,7 +158,6 @@ static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
 		out_prop->height = format->height;
 		out_prop->luma_pitch = format->width;
 		out_prop->chroma_pitch = out_prop->width;
-		ret = true;
 		break;
 	case MEDIA_BUS_FMT_YUYV8_1X16:
 		out_prop->image_format = IMAGE_FORMAT_YUV422INTERLEAVED;
@@ -181,18 +165,17 @@ static bool isp4sd_get_str_out_prop(struct isp4_subdev *isp_subdev,
 		out_prop->height = format->height;
 		out_prop->luma_pitch = format->width * 2;
 		out_prop->chroma_pitch = 0;
-		ret = true;
 		break;
 	default:
 		dev_err(dev, "fail for bad image format:0x%x\n",
 			format->code);
-		ret = false;
-		break;
+		return false;
 	}
 
 	if (!out_prop->width || !out_prop->height)
-		ret = false;
-	return ret;
+		return false;
+
+	return true;
 }
 
 static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
@@ -201,23 +184,23 @@ static int isp4sd_kickoff_stream(struct isp4_subdev *isp_subdev, u32 w, u32 h)
 	struct isp4_interface *ispif = &isp_subdev->ispif;
 	struct device *dev = isp_subdev->dev;
 
-	if (sensor_info->status == ISP4SD_START_STATUS_STARTED) {
+	if (sensor_info->status == ISP4SD_START_STATUS_STARTED)
 		return 0;
-	} else if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
+
+	if (sensor_info->status == ISP4SD_START_STATUS_START_FAIL) {
 		dev_err(dev, "fail for previous start fail\n");
 		return -EINVAL;
 	}
 
 	dev_dbg(dev, "w:%u,h:%u\n", w, h);
 
-	sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
-
 	if (isp4sd_send_meta_buf(isp_subdev)) {
 		dev_err(dev, "fail to send meta buf\n");
+		sensor_info->status = ISP4SD_START_STATUS_START_FAIL;
 		return -EINVAL;
-	};
+	}
 
-	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
+	sensor_info->status = ISP4SD_START_STATUS_OFF;
 
 	if (!sensor_info->start_stream_cmd_sent &&
 	    sensor_info->buf_sent_cnt >=
@@ -249,7 +232,6 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 	struct isp4fw_cmd_set_out_ch_prop cmd_ch_prop;
 	struct isp4fw_cmd_enable_out_ch cmd_ch_en;
 	struct device *dev = isp_subdev->dev;
-	struct isp4fw_image_prop *out_prop;
 	int ret;
 
 	if (output_info->start_status == ISP4SD_START_STATUS_STARTED)
@@ -262,20 +244,12 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 
 	/*
 	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
-	 * zeroed, since this may not guarantee on all compilers.
+	 * zeroed, since this is not guaranteed on all compilers.
 	 */
 	memset(&cmd_ch_prop, 0, sizeof(cmd_ch_prop));
-	/*
-	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
-	 * zeroed, since this may not guarantee on all compilers.
-	 */
-	memset(&cmd_ch_en, 0, sizeof(cmd_ch_en));
-	out_prop = &cmd_ch_prop.image_prop;
 	cmd_ch_prop.ch = ISP_PIPE_OUT_CH_PREVIEW;
-	cmd_ch_en.ch = ISP_PIPE_OUT_CH_PREVIEW;
-	cmd_ch_en.is_enable = true;
 
-	if (!isp4sd_get_str_out_prop(isp_subdev, out_prop, state, pad)) {
+	if (!isp4sd_get_str_out_prop(isp_subdev, &cmd_ch_prop.image_prop, state, pad)) {
 		dev_err(dev, "fail to get out prop\n");
 		return -EINVAL;
 	}
@@ -288,29 +262,34 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		cmd_ch_prop.image_prop.chroma_pitch);
 
 	ret = isp4if_send_command(ispif, CMD_ID_SET_OUT_CHAN_PROP,
-				  &cmd_ch_prop,
-				  sizeof(cmd_ch_prop));
+				  &cmd_ch_prop, sizeof(cmd_ch_prop));
 	if (ret) {
 		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
 		dev_err(dev, "fail to set out prop\n");
 		return ret;
-	};
+	}
 
+	/*
+	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
+	 * zeroed, since this is not guaranteed on all compilers.
+	 */
+	memset(&cmd_ch_en, 0, sizeof(cmd_ch_en));
+	cmd_ch_en.ch = ISP_PIPE_OUT_CH_PREVIEW;
+	cmd_ch_en.is_enable = true;
 	ret = isp4if_send_command(ispif, CMD_ID_ENABLE_OUT_CHAN,
 				  &cmd_ch_en, sizeof(cmd_ch_en));
-
 	if (ret) {
 		output_info->start_status = ISP4SD_START_STATUS_START_FAIL;
 		dev_err(dev, "fail to enable channel\n");
 		return ret;
 	}
 
-	dev_dbg(dev, "enable channel %s\n",
-		isp4dbg_get_out_ch_str(cmd_ch_en.ch));
+	dev_dbg(dev, "enable channel %s\n", isp4dbg_get_out_ch_str(cmd_ch_en.ch));
 
 	if (!sensor_info->start_stream_cmd_sent) {
-		ret = isp4sd_kickoff_stream(isp_subdev, out_prop->width,
-					    out_prop->height);
+		ret = isp4sd_kickoff_stream(isp_subdev,
+					    cmd_ch_prop.image_prop.width,
+					    cmd_ch_prop.image_prop.height);
 		if (ret) {
 			dev_err(dev, "kickoff stream fail %d\n", ret);
 			return ret;
@@ -345,7 +324,7 @@ static int isp4sd_init_stream(struct isp4_subdev *isp_subdev)
 
 	ret  = isp4sd_setup_fw_mem_pool(isp_subdev);
 	if (ret) {
-		dev_err(dev, "fail to  setup fw mem pool\n");
+		dev_err(dev, "fail to setup fw mem pool\n");
 		return ret;
 	}
 
@@ -363,61 +342,42 @@ static void isp4sd_reset_stream_info(struct isp4_subdev *isp_subdev,
 {
 	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
 	struct v4l2_mbus_framefmt *format;
-	struct isp4sd_output_info *str_info;
 
 	format = v4l2_subdev_state_get_format(state, pad, 0);
-
 	if (!format) {
-		dev_err(isp_subdev->dev, "fail to setup stream path\n");
+		dev_err(isp_subdev->dev, "fail to get v4l2 format\n");
 	} else {
 		memset(format, 0, sizeof(*format));
 		format->code = MEDIA_BUS_FMT_YUYV8_1_5X8;
 	}
 
-	str_info = &sensor_info->output_info;
-	str_info->start_status = ISP4SD_START_STATUS_NOT_START;
-}
-
-static bool isp4sd_is_stream_running(struct isp4_subdev *isp_subdev)
-{
-	struct isp4sd_sensor_info *sif;
-	enum isp4sd_start_status stat;
-
-	sif = &isp_subdev->sensor_info;
-	stat = sif->output_info.start_status;
-	if (stat == ISP4SD_START_STATUS_STARTED)
-		return true;
-
-	return false;
+	sensor_info->output_info.start_status = ISP4SD_START_STATUS_OFF;
 }
 
 static void isp4sd_reset_camera_info(struct isp4_subdev *isp_subdev,
 				     struct v4l2_subdev_state *state, u32 pad)
 {
-	struct isp4sd_sensor_info *info  = &isp_subdev->sensor_info;
+	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
 
-	info->status = ISP4SD_START_STATUS_NOT_START;
+	sensor_info->status = ISP4SD_START_STATUS_OFF;
 	isp4sd_reset_stream_info(isp_subdev, state, pad);
 
-	info->start_stream_cmd_sent = false;
+	sensor_info->start_stream_cmd_sent = false;
 }
 
 static int isp4sd_uninit_stream(struct isp4_subdev *isp_subdev,
 				struct v4l2_subdev_state *state, u32 pad)
 {
+	struct isp4sd_output_info *output_info = &isp_subdev->sensor_info.output_info;
 	struct isp4_interface *ispif = &isp_subdev->ispif;
 	struct device *dev = isp_subdev->dev;
-	bool running;
-
-	running = isp4sd_is_stream_running(isp_subdev);
 
-	if (running) {
+	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
 		dev_dbg(dev, "fail for stream is still running\n");
 		return -EINVAL;
 	}
 
 	isp4sd_reset_camera_info(isp_subdev, state, pad);
-
 	isp4if_clear_cmdq(ispif);
 	return 0;
 }
@@ -437,60 +397,25 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
 		para->cmd_id, para->cmd_status, para->cmd_seq_num,
 		ele);
 
-	if (!ele)
-		return;
-
-	if (ele->cmd_complete) {
-		dev_dbg(dev, "signal cmd_complete %p\n", ele->cmd_complete);
-		complete(ele->cmd_complete);
+	if (ele) {
+		complete(&ele->cmd_done);
+		if (atomic_dec_and_test(&ele->refcnt))
+			kfree(ele);
 	}
-
-	kfree(ele);
 }
 
 static struct isp4fw_meta_info *isp4sd_get_meta_by_mc(struct isp4_subdev *isp_subdev,
 						      u64 mc)
 {
-	int i;
-
-	for (i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
+	for (int i = 0; i < ISP4IF_MAX_STREAM_BUF_COUNT; i++) {
 		struct isp4if_gpu_mem_info *meta_info_buf =
 				isp_subdev->ispif.meta_info_buf[i];
 
 		if (meta_info_buf->gpu_mc_addr == mc)
 			return meta_info_buf->sys_addr;
 	}
-	return NULL;
-}
 
-static struct isp4if_img_buf_node *
-isp4sd_preview_done(struct isp4_subdev *isp_subdev,
-		    struct isp4fw_meta_info *meta,
-		    struct isp4vid_framedone_param *pcb)
-{
-	struct isp4_interface *ispif = &isp_subdev->ispif;
-	struct isp4if_img_buf_node *prev = NULL;
-	struct device *dev = isp_subdev->dev;
-
-	pcb->preview.status = ISP4VID_BUF_DONE_STATUS_ABSENT;
-	if (meta->preview.enabled &&
-	    (meta->preview.status == BUFFER_STATUS_SKIPPED ||
-	     meta->preview.status == BUFFER_STATUS_DONE ||
-	     meta->preview.status == BUFFER_STATUS_DIRTY)) {
-		prev = isp4if_dequeue_buffer(ispif);
-		if (!prev) {
-			dev_err(dev, "fail null prev buf\n");
-		} else {
-			pcb->preview.buf = prev->buf_info;
-			pcb->preview.status = ISP4VID_BUF_DONE_STATUS_SUCCESS;
-		}
-	} else if (meta->preview.enabled) {
-		dev_err(dev, "fail bad preview status %u(%s)\n",
-			meta->preview.status,
-			isp4dbg_get_buf_done_str(meta->preview.status));
-	}
-
-	return prev;
+	return NULL;
 }
 
 static void isp4sd_send_meta_info(struct isp4_subdev *isp_subdev,
@@ -508,64 +433,64 @@ static void isp4sd_send_meta_info(struct isp4_subdev *isp_subdev,
 
 	/*
 	 * The struct will be shared with ISP FW, use memset() to guarantee padding bits are
-	 * zeroed, since this may not guarantee on all compilers.
+	 * zeroed, since this is not guaranteed on all compilers.
 	 */
 	memset(&buf_type, 0, sizeof(buf_type));
-	if (meta_info_mc) {
-		buf_type.buffer_type = BUFFER_TYPE_META_INFO;
-		buf_type.buffer.buf_tags = 0;
-		buf_type.buffer.vmid_space.bit.vmid = 0;
-		buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
-		isp4if_split_addr64(meta_info_mc,
-				    &buf_type.buffer.buf_base_a_lo,
-				    &buf_type.buffer.buf_base_a_hi);
-
-		buf_type.buffer.buf_size_a = ISP4SD_META_BUF_SIZE;
-		if (isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
-					&buf_type, sizeof(buf_type))) {
-			dev_err(dev, "fail send meta_info 0x%llx\n",
-				meta_info_mc);
-		} else {
-			dev_dbg(dev, "resend meta_info 0x%llx\n", meta_info_mc);
-		}
-	}
+	buf_type.buffer_type = BUFFER_TYPE_META_INFO;
+	buf_type.buffer.vmid_space.bit.space = ADDR_SPACE_TYPE_GPU_VA;
+	buf_type.buffer.bufs[0].addr = meta_info_mc;
+	buf_type.buffer.bufs[0].size = ISP4SD_META_BUF_SIZE;
+
+	if (isp4if_send_command(ispif, CMD_ID_SEND_BUFFER,
+				&buf_type, sizeof(buf_type)))
+		dev_err(dev, "fail send meta_info 0x%llx\n",
+			meta_info_mc);
+	else
+		dev_dbg(dev, "resend meta_info 0x%llx\n", meta_info_mc);
 }
 
 static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 				      enum isp4if_stream_id stream_id,
 				      struct isp4fw_resp_param_package *para)
 {
-	struct isp4vid_framedone_param pcb = {};
+	struct isp4_interface *ispif = &isp_subdev->ispif;
 	struct device *dev = isp_subdev->dev;
 	struct isp4if_img_buf_node *prev;
 	struct isp4fw_meta_info *meta;
-	u64 mc = 0;
+	u64 mc = para->package_addr;
 
-	mc = isp4if_join_addr64(para->package_addr_lo, para->package_addr_hi);
 	meta = isp4sd_get_meta_by_mc(isp_subdev, mc);
 	if (!meta) {
 		dev_err(dev, "fail to get meta from mc %llx\n", mc);
 		return;
 	}
 
-	pcb.poc = meta->poc;
-	pcb.cam_id = 0;
-
 	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,%s(%i)\n",
 		ktime_get_ns(), stream_id, meta->poc,
 		meta->preview.enabled,
 		isp4dbg_get_buf_done_str(meta->preview.status),
 		meta->preview.status);
 
-	prev = isp4sd_preview_done(isp_subdev, meta, &pcb);
-	if (pcb.preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT) {
-		isp4dbg_show_bufmeta_info(dev, "prev", &meta->preview,
-					  &pcb.preview.buf);
-		isp4vid_notify(&isp_subdev->isp_vdev, &pcb);
+	if (meta->preview.enabled &&
+	    (meta->preview.status == BUFFER_STATUS_SKIPPED ||
+	     meta->preview.status == BUFFER_STATUS_DONE ||
+	     meta->preview.status == BUFFER_STATUS_DIRTY)) {
+		prev = isp4if_dequeue_buffer(ispif);
+		if (prev) {
+			isp4dbg_show_bufmeta_info(dev, "prev", &meta->preview,
+						  &prev->buf_info);
+			isp4vid_handle_frame_done(&isp_subdev->isp_vdev,
+						  &prev->buf_info);
+			isp4if_dealloc_buffer_node(prev);
+		} else {
+			dev_err(dev, "fail null prev buf\n");
+		}
+	} else if (meta->preview.enabled) {
+		dev_err(dev, "fail bad preview status %u(%s)\n",
+			meta->preview.status,
+			isp4dbg_get_buf_done_str(meta->preview.status));
 	}
 
-	isp4if_dealloc_buffer_node(prev);
-
 	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
 		isp4sd_send_meta_info(isp_subdev, mc);
 
@@ -584,12 +509,20 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 		isp_fw_log_print(isp_subdev);
 
 	while (true) {
-		int ret;
-
-		ret = isp4if_f2h_resp(ispif, stream_id, &resp);
-		if (ret) {
-			enable_irq(isp_subdev->irq[stream_id]);
-			break;
+		if (isp4if_f2h_resp(ispif, stream_id, &resp)) {
+			/*
+			 * Re-enable the interrupt and then recheck to see if
+			 * there is a new response. To ensure that an in-flight
+			 * interrupt is not lost, enabling the interrupt must
+			 * occur _before_ checking for a new response, hence a
+			 * memory barrier is needed. Disable the interrupt again
+			 * if there was a new response.
+			 */
+			isp4_intr_enable(isp_subdev, stream_id, true);
+			mb();
+			if (likely(isp4if_f2h_resp(ispif, stream_id, &resp)))
+				break;
+			isp4_intr_enable(isp_subdev, stream_id, false);
 		}
 
 		switch (resp.resp_id) {
@@ -610,50 +543,42 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 	}
 }
 
-static s32 isp4sd_fw_resp_thread_wrapper(void *context)
+static s32 isp4sd_fw_resp_thread(void *context)
 {
 	struct isp4_subdev_thread_param *para = context;
-	struct isp4sd_thread_handler *thread_ctx;
-	enum isp4if_stream_id stream_id;
-
-	struct isp4_subdev *isp_subdev;
-	struct device *dev;
+	struct isp4_subdev *isp_subdev = para->isp_subdev;
+	struct isp4sd_thread_handler *thread_ctx =
+		&isp_subdev->fw_resp_thread[para->idx];
+	struct device *dev = isp_subdev->dev;
 
-	if (!para)
-		return -EINVAL;
+	dev_dbg(dev, "[%u] fw resp thread started\n", para->idx);
+	while (true) {
+		wait_event_interruptible(thread_ctx->waitq, thread_ctx->resp_ready);
+		thread_ctx->resp_ready = false;
 
-	isp_subdev = para->isp_subdev;
-	dev = isp_subdev->dev;
+		if (kthread_should_stop()) {
+			dev_dbg(dev, "[%u] fw resp thread quit\n", para->idx);
+			break;
+		}
 
-	switch (para->idx) {
-	case 0:
-		stream_id = ISP4IF_STREAM_ID_GLOBAL;
-		break;
-	case 1:
-		stream_id = ISP4IF_STREAM_ID_1;
-		break;
-	default:
-		dev_err(dev, "fail invalid %d\n", para->idx);
-		return -EINVAL;
+		isp4sd_fw_resp_func(isp_subdev, para->idx);
 	}
 
-	thread_ctx = &isp_subdev->fw_resp_thread[para->idx];
-
-	thread_ctx->wq_cond = 0;
-	init_waitqueue_head(&thread_ctx->waitq);
+	return 0;
+}
 
-	dev_dbg(dev, "[%u] started\n", para->idx);
+static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
+{
+	int i;
 
-	while (true) {
-		wait_event_interruptible(thread_ctx->waitq, thread_ctx->wq_cond != 0);
-		thread_ctx->wq_cond = 0;
+	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
+		struct isp4sd_thread_handler *thread_ctx =
+				&isp_subdev->fw_resp_thread[i];
 
-		if (kthread_should_stop()) {
-			dev_dbg(dev, "[%u] quit\n", para->idx);
-			break;
+		if (thread_ctx->thread) {
+			kthread_stop(thread_ctx->thread);
+			thread_ctx->thread = NULL;
 		}
-
-		isp4sd_fw_resp_func(isp_subdev, stream_id);
 	}
 
 	return 0;
@@ -669,30 +594,17 @@ static int isp4sd_start_resp_proc_threads(struct isp4_subdev *isp_subdev)
 
 		isp_subdev->isp_resp_para[i].idx = i;
 		isp_subdev->isp_resp_para[i].isp_subdev = isp_subdev;
+		init_waitqueue_head(&thread_ctx->waitq);
+		thread_ctx->resp_ready = false;
 
-		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread_wrapper,
+		thread_ctx->thread = kthread_run(isp4sd_fw_resp_thread,
 						 &isp_subdev->isp_resp_para[i],
 						 isp4sd_thread_name[i]);
 		if (IS_ERR(thread_ctx->thread)) {
 			dev_err(dev, "create thread [%d] fail\n", i);
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
-static int isp4sd_stop_resp_proc_threads(struct isp4_subdev *isp_subdev)
-{
-	int i;
-
-	for (i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++) {
-		struct isp4sd_thread_handler *thread_ctx =
-				&isp_subdev->fw_resp_thread[i];
-
-		if (thread_ctx->thread) {
-			kthread_stop(thread_ctx->thread);
 			thread_ctx->thread = NULL;
+			isp4sd_stop_resp_proc_threads(isp_subdev);
+			return -EINVAL;
 		}
 	}
 
@@ -712,11 +624,7 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
 		return -EINVAL;
 	}
 
-	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
-	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED) {
-		dev_dbg(dev, "no need power off isp_subdev\n");
-		return 0;
-	}
+	sensor_info->status = ISP4SD_START_STATUS_OFF;
 
 	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
 		disable_irq(isp_subdev->irq[i]);
@@ -733,7 +641,7 @@ static int isp4sd_pwroff_and_deinit(struct isp4_subdev *isp_subdev)
 			perf_state, ret);
 
 	/* hold ccpu reset */
-	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0x0);
+	isp4hw_wreg(isp_subdev->mmio, ISP_SOFT_RESET, 0);
 	isp4hw_wreg(isp_subdev->mmio, ISP_POWER_STATUS, 0);
 	ret = pm_runtime_put_sync(dev);
 	if (ret)
@@ -778,7 +686,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
 		if (ret) {
 			dev_err(dev, "fail to power on isp_subdev ret %d\n",
 				ret);
-			goto err_unlock_and_close;
+			goto err_deinit;
 		}
 
 		/* ISPPG ISP Power Status */
@@ -788,7 +696,7 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
 			dev_err(dev,
 				"fail to set performance state %u, ret %d\n",
 				perf_state, ret);
-			goto err_unlock_and_close;
+			goto err_deinit;
 		}
 
 		ispif->status = ISP4IF_STATUS_PWR_ON;
@@ -800,21 +708,20 @@ static int isp4sd_pwron_and_init(struct isp4_subdev *isp_subdev)
 	ret = isp4if_start(ispif);
 	if (ret) {
 		dev_err(dev, "fail to start isp_subdev interface\n");
-		goto err_unlock_and_close;
+		goto err_deinit;
 	}
 
 	if (isp4sd_start_resp_proc_threads(isp_subdev)) {
 		dev_err(dev, "isp_start_resp_proc_threads fail");
-		goto err_unlock_and_close;
-	} else {
-		dev_dbg(dev, "create resp threads ok");
+		goto err_deinit;
 	}
+	dev_dbg(dev, "create resp threads ok");
 
 	for (int i = 0; i < ISP4SD_MAX_FW_RESP_STREAM_NUM; i++)
 		enable_irq(isp_subdev->irq[i]);
 
 	return 0;
-err_unlock_and_close:
+err_deinit:
 	isp4sd_pwroff_and_deinit(isp_subdev);
 	return -EINVAL;
 }
@@ -828,28 +735,29 @@ static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
 	struct device *dev = isp_subdev->dev;
 	int ret = 0;
 
-	dev_dbg(dev, "status %i\n", output_info->start_status);
 	guard(mutex)(&isp_subdev->ops_mutex);
+	dev_dbg(dev, "status %i\n", output_info->start_status);
 
 	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
 		struct isp4fw_cmd_enable_out_ch cmd_ch_disable;
 
+		/*
+		 * The struct will be shared with ISP FW, use memset() to guarantee
+		 * padding bits are zeroed, since this is not guaranteed on all compilers.
+		 */
+		memset(&cmd_ch_disable, 0, sizeof(cmd_ch_disable));
 		cmd_ch_disable.ch = ISP_PIPE_OUT_CH_PREVIEW;
-		cmd_ch_disable.is_enable = false;
-		ret = isp4if_send_command_sync(ispif,
-					       CMD_ID_ENABLE_OUT_CHAN,
+		/* `cmd_ch_disable.is_enable` is already false */
+		ret = isp4if_send_command_sync(ispif, CMD_ID_ENABLE_OUT_CHAN,
 					       &cmd_ch_disable,
-					       sizeof(cmd_ch_disable),
-					       ISP4SD_FW_CMD_TIMEOUT_IN_MS);
+					       sizeof(cmd_ch_disable));
 		if (ret)
 			dev_err(dev, "fail to disable stream\n");
 		else
 			dev_dbg(dev, "wait disable stream suc\n");
 
 		ret = isp4if_send_command_sync(ispif, CMD_ID_STOP_STREAM,
-					       NULL,
-					       0,
-					       ISP4SD_FW_CMD_TIMEOUT_IN_MS);
+					       NULL, 0);
 		if (ret)
 			dev_err(dev, "fail to stop steam\n");
 		else
@@ -858,7 +766,7 @@ static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
 
 	isp4if_clear_bufq(ispif);
 
-	output_info->start_status = ISP4SD_START_STATUS_NOT_START;
+	output_info->start_status = ISP4SD_START_STATUS_OFF;
 	isp4sd_reset_stream_info(isp_subdev, state, pad);
 
 	isp4sd_uninit_stream(isp_subdev, state, pad);
@@ -882,39 +790,33 @@ static int isp4sd_start_stream(struct isp4_subdev *isp_subdev,
 		return -EINVAL;
 	}
 
-	ret = isp4sd_init_stream(isp_subdev);
+	switch (output_info->start_status) {
+	case ISP4SD_START_STATUS_OFF:
+		break;
+	case ISP4SD_START_STATUS_STARTED:
+		dev_dbg(dev, "stream already started, do nothing\n");
+		return 0;
+	case ISP4SD_START_STATUS_START_FAIL:
+		dev_err(dev, "stream previously failed to start\n");
+		return -EINVAL;
+	}
 
+	ret = isp4sd_init_stream(isp_subdev);
 	if (ret) {
 		dev_err(dev, "fail to init isp_subdev stream\n");
-		ret = -EINVAL;
-		goto unlock_and_check_ret;
+		goto err_stop_stream;
 	}
 
-	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
-		ret = 0;
-		dev_dbg(dev, "stream started, do nothing\n");
-		goto unlock_and_check_ret;
-	} else if (output_info->start_status ==
-		   ISP4SD_START_STATUS_START_FAIL) {
-		ret = -EINVAL;
-		dev_err(dev, "stream  fail to start before\n");
-		goto unlock_and_check_ret;
-	}
-
-	if (isp4sd_setup_output(isp_subdev, state, pad)) {
+	ret = isp4sd_setup_output(isp_subdev, state, pad);
+	if (ret) {
 		dev_err(dev, "fail to setup output\n");
-		ret = -EINVAL;
-	} else {
-		ret = 0;
-		dev_dbg(dev, "suc to setup out\n");
+		goto err_stop_stream;
 	}
 
-unlock_and_check_ret:
-	if (ret) {
-		isp4sd_stop_stream(isp_subdev, state, pad);
-		dev_err(dev, "start stream fail\n");
-	}
+	return 0;
 
+err_stop_stream:
+	isp4sd_stop_stream(isp_subdev, state, pad);
 	return ret;
 }
 
@@ -975,7 +877,6 @@ static int isp4sd_ioc_send_img_buf(struct v4l2_subdev *sd,
 
 error_release_buf_node:
 	isp4if_dealloc_buffer_node(buf_node);
-
 	return ret;
 }
 
@@ -1125,7 +1026,7 @@ int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
 
 	mutex_init(&isp_subdev->ops_mutex);
 	sensor_info->start_stream_cmd_sent = false;
-	sensor_info->status = ISP4SD_START_STATUS_NOT_START;
+	sensor_info->status = ISP4SD_START_STATUS_OFF;
 
 	/* create ISP enable gpio control */
 	isp_subdev->enable_gpio = devm_gpiod_get(isp_subdev->dev,
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
index 32a5f888a16d..9f7633bd27a4 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.h
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
@@ -46,7 +46,7 @@ enum isp4sd_status {
 
 /* used to indicate the status of sensor, output stream */
 enum isp4sd_start_status {
-	ISP4SD_START_STATUS_NOT_START,
+	ISP4SD_START_STATUS_OFF,
 	ISP4SD_START_STATUS_STARTED,
 	ISP4SD_START_STATUS_START_FAIL,
 };
@@ -83,7 +83,7 @@ struct isp4sd_sensor_info {
 struct isp4sd_thread_handler {
 	struct task_struct *thread;
 	wait_queue_head_t waitq;
-	int wq_cond;
+	bool resp_ready;
 };
 
 struct isp4_subdev_thread_param {
@@ -114,9 +114,10 @@ struct isp4_subdev {
 	void __iomem *mmio;
 	struct isp4_subdev_thread_param isp_resp_para[ISP4SD_MAX_FW_RESP_STREAM_NUM];
 	int irq[ISP4SD_MAX_FW_RESP_STREAM_NUM];
+	spinlock_t irq_lock;
 #ifdef CONFIG_DEBUG_FS
-	struct dentry *debugfs_dir;
 	bool enable_fw_log;
+	struct dentry *debugfs_dir;
 	char *fw_log_output;
 #endif
 };
diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
index 456435f6e771..467ee80f54e8 100644
--- a/drivers/media/platform/amd/isp4/isp4_video.c
+++ b/drivers/media/platform/amd/isp4/isp4_video.c
@@ -60,12 +60,10 @@ static const struct v4l2_fract isp4vid_tpfs[] = {
 	{ 1, ISP4VID_MAX_PREVIEW_FPS }
 };
 
-static void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
-				      const struct isp4if_img_buf_info *img_buf,
-				      bool done_suc)
+void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
+			       const struct isp4if_img_buf_info *img_buf)
 {
 	struct isp4vid_capture_buffer *isp4vid_buf;
-	enum vb2_buffer_state state;
 	void *vbuf;
 
 	scoped_guard(mutex, &isp_vdev->buf_list_lock) {
@@ -95,30 +93,12 @@ static void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
 	vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
 			      0, isp_vdev->format.sizeimage);
 
-	state = done_suc ? VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-	vb2_buffer_done(&isp4vid_buf->vb2.vb2_buf, state);
+	vb2_buffer_done(&isp4vid_buf->vb2.vb2_buf, VB2_BUF_STATE_DONE);
 
 	dev_dbg(isp_vdev->dev, "call vb2_buffer_done(size=%u)\n",
 		isp_vdev->format.sizeimage);
 }
 
-s32 isp4vid_notify(void *cb_ctx, struct isp4vid_framedone_param *evt_param)
-{
-	struct isp4vid_dev *isp4vid_vdev = cb_ctx;
-
-	if (evt_param->preview.status != ISP4VID_BUF_DONE_STATUS_ABSENT) {
-		bool suc;
-
-		suc = (evt_param->preview.status ==
-		       ISP4VID_BUF_DONE_STATUS_SUCCESS);
-		isp4vid_handle_frame_done(isp4vid_vdev,
-					  &evt_param->preview.buf,
-					  suc);
-	}
-
-	return 0;
-}
-
 static unsigned int isp4vid_vb2_num_users(void *buf_priv)
 {
 	struct isp4vid_vb2_buf *buf = buf_priv;
@@ -661,7 +641,7 @@ static int isp4vid_set_fmt_2_isp(struct v4l2_subdev *sdev, struct v4l2_pix_forma
 		break;
 	default:
 		return -EINVAL;
-	};
+	}
 	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
 	fmt.pad = ISP4VID_PAD_VIDEO_OUTPUT;
 	fmt.format.width = pix_fmt->width;
@@ -853,7 +833,7 @@ static unsigned int isp4vid_get_image_size(struct v4l2_pix_format *fmt)
 	default:
 		return 0;
 	}
-};
+}
 
 static int isp4vid_qops_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 				    unsigned int *nplanes, unsigned int sizes[],
@@ -867,7 +847,7 @@ static int isp4vid_qops_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers
 			"fail to setup queue, no mplane supported %u\n",
 			*nplanes);
 		return -EINVAL;
-	};
+	}
 
 	if (*nplanes == 1) {
 		unsigned int size;
@@ -934,7 +914,7 @@ static void isp4vid_qops_buffer_queue(struct vb2_buffer *vb)
 			img_buf->planes[0].len);
 
 		img_buf->planes[1].len = uv_size;
-		img_buf->planes[1].sys_addr = ((u8 *)priv_buf->vaddr + y_size);
+		img_buf->planes[1].sys_addr = priv_buf->vaddr + y_size;
 		img_buf->planes[1].mc_addr = priv_buf->gpu_addr + y_size;
 
 		dev_dbg(isp_vdev->dev, "img_buf[1]: mc=0x%llx size=%u",
@@ -966,8 +946,8 @@ static void isp4vid_qops_buffer_queue(struct vb2_buffer *vb)
 	if (isp_vdev->stream_started)
 		isp_vdev->ops->send_buffer(isp_vdev->isp_sdev, img_buf);
 
-	guard(mutex)(&isp_vdev->buf_list_lock);
-	list_add_tail(&buf->list, &isp_vdev->buf_list);
+	scoped_guard(mutex, &isp_vdev->buf_list_lock)
+		list_add_tail(&buf->list, &isp_vdev->buf_list);
 }
 
 static int isp4vid_qops_start_streaming(struct vb2_queue *vq, unsigned int count)
@@ -1007,10 +987,8 @@ static int isp4vid_qops_start_streaming(struct vb2_queue *vq, unsigned int count
 		}
 	}
 
-	list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list) {
-		isp_vdev->ops->send_buffer(isp_vdev->isp_sdev,
-					   &isp4vid_buf->img_buf);
-	}
+	list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
+		isp_vdev->ops->send_buffer(isp_vdev->isp_sdev, &isp4vid_buf->img_buf);
 
 	/* Start the media pipeline */
 	ret = video_device_pipeline_start(&isp_vdev->vdev, &isp_vdev->pipe);
@@ -1162,12 +1140,13 @@ int isp4vid_dev_init(struct isp4vid_dev *isp_vdev, struct v4l2_subdev *isp_sdev,
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret) {
 		dev_err(v4l2_dev->dev, "register video device fail:%d\n", ret);
-		media_entity_cleanup(&isp_vdev->vdev.entity);
-		goto err_release_vb2_queue;
+		goto err_entity_cleanup;
 	}
 
 	return 0;
 
+err_entity_cleanup:
+	media_entity_cleanup(&isp_vdev->vdev.entity);
 err_release_vb2_queue:
 	vb2_queue_release(q);
 	return ret;
diff --git a/drivers/media/platform/amd/isp4/isp4_video.h b/drivers/media/platform/amd/isp4/isp4_video.h
index d925f67567e7..b87316d2a2e5 100644
--- a/drivers/media/platform/amd/isp4/isp4_video.h
+++ b/drivers/media/platform/amd/isp4/isp4_video.h
@@ -11,26 +11,6 @@
 
 #include "isp4_interface.h"
 
-enum isp4vid_buf_done_status {
-	/* It means no corresponding image buf in fw response */
-	ISP4VID_BUF_DONE_STATUS_ABSENT,
-	ISP4VID_BUF_DONE_STATUS_SUCCESS,
-	ISP4VID_BUF_DONE_STATUS_FAILED
-};
-
-struct isp4vid_buf_done_info {
-	enum isp4vid_buf_done_status status;
-	struct isp4if_img_buf_info buf;
-};
-
-/* call back parameter for CB_EVT_ID_FRAME_DONE */
-struct isp4vid_framedone_param {
-	s32 poc;
-	s32 cam_id;
-	s64 time_stamp;
-	struct isp4vid_buf_done_info preview;
-};
-
 struct isp4vid_capture_buffer {
 	/*
 	 * struct vb2_v4l2_buffer must be the first element
@@ -79,6 +59,7 @@ int isp4vid_dev_init(struct isp4vid_dev *isp_vdev,
 
 void isp4vid_dev_deinit(struct isp4vid_dev *isp_vdev);
 
-s32 isp4vid_notify(void *cb_ctx, struct isp4vid_framedone_param *evt_param);
+void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
+			       const struct isp4if_img_buf_info *img_buf);
 
 #endif /* _ISP4_VIDEO_H_ */
-- 
2.51.2


--AgFja2OVHERMxdW1--

