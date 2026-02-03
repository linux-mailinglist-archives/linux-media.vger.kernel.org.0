Return-Path: <linux-media+bounces-52087-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI8UB2eygWmhIwMAu9opvQ
	(envelope-from <linux-media+bounces-52087-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:31:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C10D640A
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 09:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 444DA300E240
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 08:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594C2393DF5;
	Tue,  3 Feb 2026 08:31:32 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116A22E543B
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 08:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107491; cv=none; b=TIpEy0lAxsrKCmAykn5RghNpHS0aHw5OQ6lZp6vDiCVajzFzBq7CcY1kcPVADGkLAk2sXYk0l8JJfkV/R7HyeCyaswRpfUwmwUbfrIVZiR3iVOujdTxVKHwf/5RWPqc314HQt0r/K8ddFJhfK8Etsb8mcWMA+wcPpErXSYCr164=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107491; c=relaxed/simple;
	bh=x1NDGYyjVNVexG5Ob0VyhhbXb1lkIoaJMjvDlD6Yprk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxTu9LuQCDLaYCsP08qYJ6QDYAcSkjEN6c7/j2lZEYrrUzgnmvRkksIo6GUf7g9fn6DJLwISImAII3AvTQNmH0IbMjO1k4DnGFFl0n+XHdutvPUg2f84yWz+5G6AySWUEulXiAOyF5F4j5/tj+3Bj/9ySzznt/wv0s1z0Wwv7zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vnBoW-000544-4N; Tue, 03 Feb 2026 09:31:12 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vnBoU-003sBH-31;
	Tue, 03 Feb 2026 09:31:10 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vnBoU-00E0iN-0J;
	Tue, 03 Feb 2026 09:31:10 +0100
Date: Tue, 3 Feb 2026 09:31:10 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, ulf.hansson@linaro.org, Frank.li@nxp.com,
	peng.fan@nxp.com, festevam@gmail.com, robh@kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	linux-imx@nxp.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, linux-pm@vger.kernel.org,
	s.hauer@pengutronix.de, mchehab@kernel.org,
	linux-arm-kernel@lists.infradead.org, eagle.zhou@nxp.com,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de,
	hverkuil-cisco@xs4all.nl, krzk+dt@kernel.org, shawnguo@kernel.org,
	l.stach@pengutronix.de
Subject: Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for
 4K60fps decoding
Message-ID: <20260203083110.woan3gmc3qdh7nmm@pengutronix.de>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
 <df8d5d5f28870752e77ec74f34fea7ceb6e97286.camel@ndufresne.ca>
 <0b24716b-438c-4185-8a93-3a3879147c24@oss.nxp.com>
 <169eba79e8e1f906b1a0b59e22a531dfc7e57a1f.camel@ndufresne.ca>
 <5e3431c69da07557edb20a252c4759be8c857f08.camel@ndufresne.ca>
 <ca3a8042-1394-4925-9c61-dbfcbf4cf7d9@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca3a8042-1394-4925-9c61-dbfcbf4cf7d9@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ndufresne.ca,vger.kernel.org,lists.linux.dev,linaro.org,nxp.com,gmail.com,kernel.org,collabora.com,pengutronix.de,lists.infradead.org,xs4all.nl];
	TAGGED_FROM(0.00)[bounces-52087-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:url,pengutronix.de:mid]
X-Rspamd-Queue-Id: 83C10D640A
X-Rspamd-Action: no action

Hi,

sorry for jumping in.

On 26-02-03, Ming Qian(OSS) wrote:
> Hi Nicolas,
> 
> On 2/3/2026 3:12 AM, Nicolas Dufresne wrote:
> > Hi,
> > 
> > Le lundi 02 février 2026 à 13:44 -0500, Nicolas Dufresne a écrit :
> > > > This doesn't sound like just a VPU issue; it's related to the display or
> > > > DDR.
> > > > If not displayed, do the fluster test cases yield different results at
> > > > 600MHz and 300MHz?
> > > 
> > > Didn't you run these tests before sending ? I can try again, but in my
> > > internal
> > > notes, I wrote:
> > > 
> > >    > Tested that, and everything becomes unstable
> > > 
> > > That was before I figure-out the IRQ handler didn't handle exception bits that
> > > didn't stop the decoder (or dry IRQ, which strangely is common from the G2).
> > 
> > Ran some fluster tests now. With this patch the results is not consistent
> > anymore. Then I ran it with weston being started, and in the middle of the test
> > the display turned black. Matches my past observation. We did reproduce this on
> > BSP kernel too. When the display goes black, the recent hantro drivers reports:
> > 
> > [  827.581586] hantro-vpu 38310000.video-codec: frame decode timed out.
> > [  827.720201] hantro-vpu 38310000.video-codec: not all macroblocks were
> > decoded.
> > 
> > 
> > I have local patches to reduce the cascade of errors, so it likely survived
> > longer then last time. I will send these patches soon. The "not all macroblocks
> > were decoded." is triggered by a bit in the status register that is not
> > documented in NXP TRM. I found that bit in some VC8000D documentation (the
> > sucessor of G2). I concluded it was the same meaning after looking at the failed
> > buffer visually, it is indeed missing couple of macroblocks near th end. Each
> > time we see this error, the DCSS gives up and turn either black, or sometimes
> > other color. The second case has been tracked to a DCSS Scaler underrun, the
> > first we don't know.
> > 
> > Fluster command ran (two threads, never completes):
> > 
> > ./fluster.py run -d GStreamer-H.265-V4L2SL-Gst1.0 -ts JCT-VC-HEVC_V1 -j2 -t90
> > 
> > Nicolas
> 
> My test results for fluster differ from yours.
> On my end, the results for JCT-VC-HEVC_V1 are consistent at both 300MHz and
> 600MHz.
> And results remained unchanged after multiple tests.
> 
> I'm not sure what caused the differences between us.

Once it comes to system stability, you need to ensure that your
bootstack is aligned e.g. same TF-A version and sometimes same
bootloader since there might be workarounds/erratum applied by the boot
firmware.

Regards,
  Marco

> 
> Below are my test results:
> 
> 600Mhz, 0.9v
> 	cat /sys/kernel/debug/regulator/regulator_summary  |grep SW1C
> 	 SW1C                             0    1      0 unknown   900mV     0mA
> 825mV  1100mV
> 	cat /sys/kernel/debug/clk/vpu_g2/clk_rate
> 	600000000
> 
> 	./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2SL-Gst1.0 -j2 -t
> 90
> 	****************************************************************************************************
> 	Running test suite JCT-VC-HEVC_V1 with decoder
> GStreamer-H.265-V4L2SL-Gst1.0
> 	Using 2 parallel job(s)
> 	****************************************************************************************************
> 
> 	Ran 139/147 tests successfully               in 505.434 secs
> 	Ran 139/147 tests successfully               in 505.350 secs
> 	Ran 139/147 tests successfully               in 507.540 secs
> 
> 600Mhz, 1.0v
> 	cat /sys/kernel/debug/regulator/regulator_summary  |grep SW1C
> 	 SW1C                             0    1      0 unknown  1000mV     0mA
> 825mV  1100mV
> 	cat /sys/kernel/debug/clk/vpu_g2/clk_rate
> 	600000000
> 
> 	./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2SL-Gst1.0 -j2 -t
> 90
> 	Ran 139/147 tests successfully               in 506.901 secs
> 
> 300Mhz, 0.9v
> 	cat /sys/kernel/debug/regulator/regulator_summary  |grep SW1C
> 	 SW1C                             0    1      0 unknown   900mV     0mA
> 825mV  1100mV
> 	cat /sys/kernel/debug/clk/vpu_g2/clk_rate
> 	300000000
> 
> 	./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2SL-Gst1.0 -j2 -t
> 90
> 	Ran 139/147 tests successfully               in 506.063 secs
> 
> Downstream v4l2 driver
> 	cat /sys/kernel/debug/regulator/regulator_summary  |grep SW1C
> 	 SW1C                             0    2      0 unknown  1000mV     0mA
> 825mV  1100mV
> 	cat /sys/kernel/debug/clk/vpu_g2/clk_rate
> 	600000000
> 
> 	./fluster.py run -ts JCT-VC-HEVC_V1 -d GStreamer-H.265-V4L2-Gst1.0 -j2 -t
> 90
> 	Ran 136/147 tests successfully               in 460.435 secs
> 
> Regards,
> Ming
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

