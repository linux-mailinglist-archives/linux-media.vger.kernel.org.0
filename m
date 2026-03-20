Return-Path: <linux-media+bounces-56572-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDbHGYilvWm4/wIAu9opvQ
	(envelope-from <linux-media+bounces-56572-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 20:52:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC1E2E084E
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 20:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B570F3041276
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA9F3563F6;
	Fri, 20 Mar 2026 19:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="HI36ZShg"
X-Original-To: linux-media@vger.kernel.org
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C15B346FCA;
	Fri, 20 Mar 2026 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774036114; cv=none; b=SYiClRDrzr1jIpT+pPYv/G0VaUKrh5Duvr8vjeVEoMh4nA5yfYax1dDBkMAs1kJj2xh+CCNcJ0OCYwfkmaC3dUh0DgCnsnuJlnRCJLTP6xrBE6UL+RdcOJotEP2ghuODJIxvExodrYWUTa+/sV9cO3thVKxlRo/b/90H2xtRhXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774036114; c=relaxed/simple;
	bh=7ytz/z5ALk+SscFAnn7t/xKn1lxJTNR51Ag/WSCQ48k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzTeEmMm2J1XAVpna+LrqS/63elO9t//LCe5pycwEp7c2XgXGi1esA64dDZIFvsdm/o6qGIYkfCKTPaBiCkT0ZzZA8Rw5vgIMjT9vCfUEcGAcqfQCWGxt+ehMGQwUs274AM9PiLQg0n1O8IJVxYNCFtHGi/hCCd08Kn+0JgV99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=HI36ZShg; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1774036113; x=1805572113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q4TiEgfIAvMzCqc4KEMYNYNKQ830eOmdK/ypgIVMnB0=;
  b=HI36ZShguwu6FWGH6onECBlfEw14c0gwZSxv9TnrUSdb8S/xvg35xfxW
   i7Qml2b7qrBey99oFZynuLZljs3iXvR+67zQFOiECBdF3A8KX/gZTCjqb
   jWaLRxVHgtSuFQodJhusyBS59Kz76dWjRIRZnmj/1jbCVeL+eotudoNPc
   VX9T7FViwgMWQJ4MjBLu9ScoG60SC8/yIPl0qGpkVok/tR6CUJ910d70+
   gtA+5Bnil3eme1WvprALx6fSlGNbe55/p55FL1D0g5WaOpQ3YRr+TTc5+
   OXoUEunuueExjbj25X2cl9u8OtnH0/FWoIMm996DY7BMpl7OxChtUW7ih
   A==;
X-CSE-ConnectionGUID: eQzROiltQkKsAskOTuVL+A==
X-CSE-MsgGUID: EKPiCysSRaKnStZUN8gGPQ==
X-IronPort-AV: E=Sophos;i="6.23,130,1770595200"; 
   d="scan'208";a="15374064"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 19:48:32 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:5335]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.60.23:2525] with esmtp (Farcaster)
 id cf03d1ac-a93d-4cd4-8130-2bf2729af980; Fri, 20 Mar 2026 19:48:32 +0000 (UTC)
X-Farcaster-Flow-ID: cf03d1ac-a93d-4cd4-8130-2bf2729af980
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Fri, 20 Mar 2026 19:48:32 +0000
Received: from localhost (10.187.171.32) by EX19D001UWA001.ant.amazon.com
 (10.13.138.214) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Fri, 20 Mar 2026
 19:48:31 +0000
Date: Fri, 20 Mar 2026 12:48:29 -0700
From: Cory Keitz <ckeitz@amazon.com>
To: <david@ixit.cz>
CC: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
	Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Joel Selvaraj
	<foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, <linux-media@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<phone-devel@vger.kernel.org>
Subject: Re: [PATCH WIP v4 9/9] media: qcom: camss: Account for C-PHY when
 calculating link frequency
Message-ID: <ab2kjbN0Igbkp6sw@bcd074ae11bb>
References: <20260301-qcom-cphy-v4-0-e53316d2cc65@ixit.cz>
 <20260301-qcom-cphy-v4-9-e53316d2cc65@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260301-qcom-cphy-v4-9-e53316d2cc65@ixit.cz>
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-7.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56572-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,oss.qualcomm.com,joelselvaraj.com,linux.intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeitz@amazon.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0AC1E2E084E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 01, 2026 at 01:51:28AM +0100, David Heidelberg via B4 Relay wrote:
> -static int csid_set_clock_rates(struct csid_device *csid)
> +static int csid_set_clock_rates(struct v4l2_subdev *sd, struct csid_device *csid)
>  {
>  	struct device *dev = csid->camss->dev;
> +	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
> +	struct csiphy_lanes_cfg *lane_cfg = &csiphy->cfg.csi2->lane_cfg;

I believe there's a regression here from v3. I've been testing v4 of
this series on SA8775P (kernel 6.18) with a GMSL2 camera pipeline and
hit an invalid pointer dereference in csid_set_clock_rates() during
pipeline power-up:

  pc : camss_get_link_freq+0x1c/0xc4 [qcom_camss]
  lr : csid_set_power+0xc8/0x404 [qcom_camss]
  Code: 910003fd a90153f3 aa0003f4 a9025bf5 (b9400040)

The sd passed here from csid_set_power() is the csid subdev, so the
subdevdata is a csid_device rather than a csiphy_device. The csid_device
stores its linked csiphy_id during csid_link_setup(), so the fix is to
look it up through the camss device array:

    static int csid_set_clock_rates(struct csid_device *csid)
    {
        struct csiphy_device *csiphy = &csid->camss->csiphy[csid->phy.csiphy_id];
        struct csiphy_lanes_cfg *lane_cfg = &csiphy->cfg.csi2->lane_cfg;

This also lets us drop the v4l2_subdev parameter entirely since it's
no longer needed. With the above change my pipeline powers on and
streams correctly.

Tested-by: Cory Keitz <ckeitz@amazon.com>

---

Regards,
Cory

