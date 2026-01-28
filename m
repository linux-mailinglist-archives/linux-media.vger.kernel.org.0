Return-Path: <linux-media+bounces-51756-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPrNHG6aemms8QEAu9opvQ
	(envelope-from <linux-media+bounces-51756-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 00:23:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 158D8A9F60
	for <lists+linux-media@lfdr.de>; Thu, 29 Jan 2026 00:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 501BE300A8F8
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 23:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BE33446B1;
	Wed, 28 Jan 2026 23:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K90z6qwu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365A29D265
	for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 23:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769642603; cv=none; b=RUjuGWfOu4UWbl2pIPJmg2GG2sF2L33bKhJW2sgVhA56pUm+8Z7eiXBG3GOeUeyt1/t/TbQEklAiaJppHaqyqlITvunkOQkauvxLSKB2owRz5FwEHOBrdAQp+LD6NPSSD/mJ70ILDMP/PZ/kXtzU/IVA9znDCzLs7R+nhC7l3XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769642603; c=relaxed/simple;
	bh=6ca1Sl8ati4GIMbwjPj+oVMEy+QZ4KssuHKcXxijejo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUTYkbqzZVcqD1gJaUa1NDVv97dfqeMKD5MyUiat6YhBD6zC/YldI9qSBafj0Cse69D+gZ8nfovKGrLTpa8/3wW+qACgNsVZev9T0ZuQISjqYpiBTVfcl9YN1NpVy7s1YemNxOeG3tEhfA1wSVmeA0H+XpSQDe1fJy8rs3ZjCSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K90z6qwu; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88ffcb14e11so5406776d6.0
        for <linux-media@vger.kernel.org>; Wed, 28 Jan 2026 15:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769642601; x=1770247401; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/R+p0Q89VOTzs/CkCyEL3M6uPrfEJ5bMsqI/Cf8cMcA=;
        b=K90z6qwuK+1/Xnm39ywbGMTfqcD+S7ZsH0SnB+CLJpInQddrut702wGJ0kMCG5fDXW
         5nSGTj993iMthvMjzahsmtk1Z16YMQTUJDerRE/mKT7ClwzPPkGi1i0C+xOtkR9PFXCN
         wS/c5jb59jkMWvDYlwvByHDc5CoEPprWg3Q1TfFrHMk7Ey1vK7+ZtGMLNWP9IrdMIESx
         Ld7Hw4Q20cF6WM7I47395kLR0WfIVEkzszvlwhQPFAfAxh0o0r5/hmr0q9vGsIBeC591
         j8DlygFXIqTElL+qv+w2fkfLzCKijzdihWj/qTJr2jW+ILtid+NK2R915riiODEIWG1+
         Al8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769642601; x=1770247401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/R+p0Q89VOTzs/CkCyEL3M6uPrfEJ5bMsqI/Cf8cMcA=;
        b=dyWFj2Wc0k+wATsVEBLApoFV/Voe+9BE32stA3D6pqYW83N0U1k6f+nQFDl/dTrFrU
         xX7MT2LfGSoDlOeTFuGyZiL8cqlLGFv6+dLpRBRSdtWTKnjM8u3+GhsiEeZ0ZSnwVixH
         vmBiATIvWFqQmGAbypNwtBpX4YIIXo4qD9+fXnlj60nnJIXqE8p2fcooYZ5ITRuYpbFl
         uUxY7vgu4ewHyyXGp/wHw+6HR/I7P382A1A3FXVep81BdbfrBasTaihEbctcGvI2c8Su
         QntGMY7CmHpm6odDvVfje6YT+YmaqOqmtPuuhhWRWHO2BfODsqMp5LPl6MRq1C0K9F63
         RthA==
X-Forwarded-Encrypted: i=1; AJvYcCXgSDE+aRIYNxqzjzACAm700+TgTNuRK0EbTRoUSP2amp4QiVsZ0xLfy417rijX/Z4KG+t3HJs+ThsaYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjFEMT1MsMx73daVXTDLrXxA1fNyCcrcmFcUGv8ARRCwjps5dr
	c5ZaEBGG0oDDJDkuCmqIl668iVbT/qCckC6Nx5ZOcKz9pDoCK9Ld0Jyh
X-Gm-Gg: AZuq6aKxTovIcHgx2sDhO6joAEjHJiV1VgIfxCfLgatXp89WHsML2ECYNTdWAsnuGCM
	x//OyG1mJWzkQ0bx+A/ZB3uSxlJ6McpaxWpZh3hKdatY1IevatvH3ns+UwThhDGQ+SAiL2mRX+U
	Fr6+wNnlD8sRUzTOaTRTtKIxpxs5rVRaW52WmR86c9vbUidAYD4a+sSO81FvfCa6eanTn/juQwi
	axzgGkZVVDvsZVWBLUtWnq/nOSTQjIGrWX8jgE/zjeMtcToTIbYMY1GwJWzDrjIobm93oj1P3d7
	vaw2wtpsltRPPDwslZt/Jam2KDjid2Ef0ydZtJ2C7XZCik4GVPDKWjwoYgHJl+HgF5pF1JCPLzu
	jcSrnNFmztR7fNl4gLR1weO8nzkQeQYXkDLL7WQNnTwHKSfxOGrIoXj6kpJPi6FWMrrOiM6CMGW
	B6bJ/ZJZqJlxbOVQ==
X-Received: by 2002:a05:620a:25d4:b0:8c6:d2ca:1d0e with SMTP id af79cd13be357-8c70b84a6fcmr916954085a.11.1769642600692;
        Wed, 28 Jan 2026 15:23:20 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375b640sm26715056d6.39.2026.01.28.15.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 15:23:19 -0800 (PST)
Date: Wed, 28 Jan 2026 18:23:43 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aXqaf4OmvSCvt5gu@rdacayan>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <578668b0-cba2-4550-b676-26ed0b447bf2@linaro.org>
 <aW-V8VTcOICLWqaU@kekkonen.localdomain>
 <aXl6MpRB9ncCeu2M@rdacayan>
 <aXnB2FUgb5OlGjfn@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXnB2FUgb5OlGjfn@kekkonen.localdomain>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51756-lists,linux-media=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 158D8A9F60
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 09:59:20AM +0200, Sakari Ailus wrote:
> On Tue, Jan 27, 2026 at 09:53:38PM -0500, Richard Acayan wrote:
> > On Tue, Jan 20, 2026 at 04:49:21PM +0200, Sakari Ailus wrote:
> > > Hi Bryan, others,
> > > 
> > > On Tue, Jan 20, 2026 at 12:44:24PM +0000, Bryan O'Donoghue wrote:
> > > > I think reset should be asserted before regulators and power are switched
> > > > on. i.e. before you try to switch the chip on, you should establish that the
> > > > reset pin is in the state that the timing diagram calls for.
> > > 
> > > Indeed.
> > 
> > I think the discussion is more about whether there should be an assert
> > in the same function as the de-assert.
> > 
> > > The xshutdown pin, as it is typically called labelled as "reset" in this
> > > case, functions as both hardware reset and hardware standby mode control.
> > > It should be asserted (i.e. be set to low level) whenever the sensor is
> > > expected to be powered off. Typically deasserting it is the last step in
> > > the sensor's power-up sequence. This applies to nearly all CSI-2 and DVP
> > > (parallel) camera sensors. (There are some exceptions that use explicitly
> > > two GPIOs for similar functions but there are very few of them.)
> > 
> > This patch has the reset asserted by the time it gets to
> > imx355_power_on():
> > 
> > - when coming from runtime PM, the suspend callback asserted it
> > - when coming from probe, GPIOD_OUT_HIGH asserted it (considering that
> >   active-low also affects the initial output setting)
> > 
> > Should it be asserted again inside the function, or
> > should the initial `gpiod_set_value_cansleep()` be removed?
> 
> Please remove it as requested.

Ok, I will remove it.

