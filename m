Return-Path: <linux-media+bounces-57701-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF5CNS8jy2kiEQYAu9opvQ
	(envelope-from <linux-media+bounces-57701-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 03:28:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA436312E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 03:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD5CC30490C6
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 01:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC763146A66;
	Tue, 31 Mar 2026 01:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQPIgX3e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88703242A4
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 01:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774920446; cv=none; b=uWqeGwx+3fUvT963DAgZo6XC5ry9MAjOR/Mrczc5HMdkQpIdZ+YqoAr2mmAtmFxZ+wK3mwIX1ftW+r7qMkOjyud8tyBtd0XFjBtLNhFWWA7bkuX/FNhMVEwipuiwiCg+CXlaaW7jD1r4LaJm/d5OTnwZHK6VCqzjliR1OlkroMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774920446; c=relaxed/simple;
	bh=DoIAKu1bIw6WjuD6GcmqJ8DVq8l3eat3WF9PWpABhgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ep2V74MF5CV9RbY26jPoDsXrTnvOjaxBgccM1f4eRyYSuO9EIRLFTr+E5972o6sFayL+JN6tcIX3C8rOBAIWe9ySEq4KimAAS340J3SnIl70+p2WrsD7W8Pn5BdUAxS9u4UGn3LHFHpkZIYDGZmsOrGMjLtSfub/vKJCH/+Ir5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQPIgX3e; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-505a1789a27so26996211cf.3
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 18:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774920444; x=1775525244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0yulhRwyETMpFsHW020W350NiZgzMyyxXfQQBfRWcw=;
        b=OQPIgX3eE3bBYxdpeHII1NQiDfY0MZc/n6fH3Q6EmBgaxJgTiFqsRaMHr8vrEL6lMm
         jrLIlunjodjTmGOZPK6k7mY8QPPJhFEnU6oH93926O9411d30yUo6Xjb2BEKBB+ucCTp
         NdanPoThIjuIDtBsTfHfGJvGw1K7xNZR/jRR/FklJOwBxa6QZeUGOO7DyKY+VeAZTAPR
         IJN4PvhCoMOwiwGdEA9gF2QdTMTZnl/BAUw9CN4rSdYb8GKRWH+V7f67Ozlqz2BfnAvk
         cumDhtWIovMuBApYCDl1IgehBegxf8WYnLCWWT6c4JxcokWqnFyiY/8+wGFi3ss+Nx6i
         5mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774920444; x=1775525244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0yulhRwyETMpFsHW020W350NiZgzMyyxXfQQBfRWcw=;
        b=clrf266q9Qap31UjZ2/bM83rt8sKBXeA+5QCbOe1zosp5QCbgv5iSCcR199sPZnIdv
         v6MwObddfxcJMrChJKy/3Cn4VaRQf69glnPEC8mMJskgc3Rz70KSx1xDXxPAb26aq0Q5
         riPUIar1NnypRWjTHEwTNvjjpICu5l2A96J/W64glF1iyRC31GBhznlptOXv6PjXi6f2
         18CpJFPYsAUuWz96UF9zOo0L3vuzFmSZ5dphQrdYLI1PjncHK6q+cVxkt+9d4sE+r96m
         cslQdD5JQ15w8Lc2Qjqylhl2Ptv2+YwNAwtZSYuJIMUH2mBQDtnGXpRqnJpnFJaKgCEZ
         dP7g==
X-Forwarded-Encrypted: i=1; AJvYcCVwoqaaErgIAvSCndm8ryocwYh/rEqAkS1pTMRBwFlsxQd+snv1MjmOY9DajDv0bm1VNy738T24pjIY1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPIN6rEYsF9857KuaAqGQIILHLSCnvy13wZ0X+zqmRccC9yxK3
	NfB9na3+YU8hWTUSEY6l1zEcvOKH/GwHp+IWFdJn4rvvozMgKaBwVf+9
X-Gm-Gg: ATEYQzwMd5UDSAzf2mjRw2/ZaFcTPOMUk9MQkj2oKXZKKMZRNQthfkGfEGMWdTPj7Tr
	tqwoy4bOFYpaqxM1Oo1B9gdrz9pQ14IJNapiAESogfpTd310k+jaxa+oERXMFRCoeGowARGLDtx
	3UeJJ9pyoF3a7ORLdzdDRlbEpE2dV/g9v96OaoX+cJ/SBMdf9O4RBOfB7jhDXqpHszX5zj7sUC/
	taMy/S4AjCR05BRgWi1OOJ8iy3MSKRZf1yNiTlijtXWoBZyhQnQ6z4wNhLB85lUSyDGmdEcODLU
	H8Ru/lB++XUMoHQK4ZBo/sJigzYKmwntHH0kLs5J1Z8sBRgIndSen8IPFJiFbMYi4sjY/TNBr4g
	NIcVsqN3DkNsEc8xPgDXE32uTgIMFj7UvsSmQfhqIzkqGCXgwKNKLNl41tBh+Fh+sjz0QpbXdSK
	tsdwUHHF/Uq2/bbeOrUWKCX7/C/w==
X-Received: by 2002:ac8:7f12:0:b0:509:320:2de6 with SMTP id d75a77b69052e-50ba386455dmr204956541cf.25.1774920443757;
        Mon, 30 Mar 2026 18:27:23 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb3df388dsm96604781cf.6.2026.03.30.18.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 18:27:23 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:27:59 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: David Heidelberg <david@ixit.cz>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Robert Mader <robert.mader@collabora.com>,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <acsjH0tZ-jj7N7c5@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
 <acHxgIsyPiQTeqCB@rdacayan>
 <eff25adf-c5fd-484d-a9ae-ec27c0d9c100@ixit.cz>
 <acJuN_FRqMTGgl8C@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acJuN_FRqMTGgl8C@kekkonen.localdomain>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57701-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,intel.com,collabora.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.980];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1a:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 58AA436312E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 12:57:59PM +0200, Sakari Ailus wrote:
> Hi David, Richard,
> 
> On Tue, Mar 24, 2026 at 10:35:24AM +0100, David Heidelberg wrote:
> > 
> > 
> > On 24/03/2026 03:05, Richard Acayan wrote:
> > > On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> > > > On 17/02/2026 01:27, Richard Acayan wrote:
> > > > [...]
> > > > 
> > > > > +&cci_i2c1 {
> > > > > +	camera@1a {
> > > > > +		compatible = "sony,imx355";
> > > > > +		reg = <0x1a>;
> > > > > +
> > > > > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > +
> > > > > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > > > > +		assigned-clock-rates = <19200000>;
> > > > 
> > > > Extract from #sdm670-mainline:erebion.eu discussion:
> > > > The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> > > > driver can operate only with 19.2 MHz.
> > > > 
> > > > I assume it would be worth it mention at least by comment here.
> > > 
> > > This might set the series back because the devicetree isn't meant to be
> > > written for specific software, but it's included in v11 because you
> > > already asked twice.
> > > 
> > 
> > I would say node with lower clock frequency is still much better than
> > nothing or placeholder saying "i2c camera here". Instead we'll have small
> > placeholder that value can be bumped to 24 MHz. Important is this can be
> > easily improved when at least one consumer of the device-tree gains support.
> > 
> > We have very scarce support of cameras on mobile phones in mainline, thus
> > leaving a comment that HW can do 24 MHz is reasonable compromise IMHO.
> 
> The bindings could document the supported frequency range.
> 
> In DTS it may make sense to set the frequency the vendor uses as it may
> affect the link frequencies (albeit I guess they're the same in this
> case?).

Is this review relevant to v11?

