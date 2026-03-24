Return-Path: <linux-media+bounces-56793-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LSXFqvywWkgYAQAu9opvQ
	(envelope-from <linux-media+bounces-56793-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:10:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B96C5300FE8
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 03:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C751308F446
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 02:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20CBE38643B;
	Tue, 24 Mar 2026 02:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzYjxuNV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24A8383C91
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 02:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317912; cv=none; b=un/AwI0Rxf0I6EkZGncGHEkyUMk+5l67CMbeoUKS3drbNWPi2NwUlDKn/OgFjdyiRzv0l31GSCXepgImzYXeTuJl1VwXV413DykarjgWQtAVH0Xsve0aGea0DLti2e2sBAY5KyoDlXRB+n9m8JGIg70yoCE3iS9l+Vi/fNMGqlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317912; c=relaxed/simple;
	bh=+ehVjjn+FFP1aRjNxMvD8VGxFjrfQtZn+7RGgcX7Sic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBx+owDZTyfNEiCNHcw+1qIWfN5AzmDXnX4IcrgdeVvTbddlXD+7qciEZ2YY7bXqBkm1eMNVAVeXWqxB7wpCoiebf5Yf3kmzKp9xo9OCAeq2CHj1wliYepjOhSyGdqrcxD2WrRY9G2+QHnfTD5V4UZusNlhIvzNHHTIL9osQLtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzYjxuNV; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cd78a4ce8dso445950985a.3
        for <linux-media@vger.kernel.org>; Mon, 23 Mar 2026 19:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317908; x=1774922708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WhBxiKr+CpFwBrUC+deA+ndmr0D+vf1b3ZxKGdD13Q8=;
        b=nzYjxuNVWsy2FAJrdUup/mIJSbRkLFV8btqoBVKVP6d3j7kaRWMaVCI1a9kj5foQ6S
         dNkE2Ur1Mcd6lE2LZ5+/gkgtKM0ls0uYRXYuAvYgnJwg+bmjKkVlRZlObOn3qVfzTN8R
         HH4viLyYStE366bC3xc700XYNzdbUVq2FgELOFvyEMqN2gmUOAt3r4ZiWNVE20yvNN8s
         BZDDAHTmYUNlIhCFRyC4WVuL2lmUGpr5WNwEPmhwmvgqkyhcoeiw3yGJ/gahQExhMZ+x
         +q2lDIpIk6GrGVGXcvcrj1qxwqJSTezPv4CIOUaxx7371PuaZH8t9xo+WPcqSHRODHgI
         XPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317908; x=1774922708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhBxiKr+CpFwBrUC+deA+ndmr0D+vf1b3ZxKGdD13Q8=;
        b=dtPrnlejqMfiVAVbKPCfe9MwYa7hssFfeNzgrmkd7zMFHnWHivu8bVkUNs+vd8MWOb
         UjS+pmz3GafdoMcMFJT3vFpC0YKW8v4QpxeTv+iK+zVTD0X1vaKtffJJw5OoVs4RWUaI
         0RFf3C2FzxKzR24f4I3m9OTSB/tjLDlIR2gXAKDJvrRvVH2FKSRiOCy8kl0sAHqnc6lJ
         R90iddVGRvpZCoZXagoPBeU5mFnPbzKfAtSKtgdmVNC2KOPuYlKFBVYmPAQ/MQAQTEWH
         fNqUZhS9W+g74E2jUnhFT6RhWyuN2X1NzzsGT5wG4Vcm8gk0Sn8b+5oyWD0LZlhScKvR
         hJEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkLNQqouxOwq9Zvm0iWahyKXxdqMdBtcj/DA0w5zHeRje569sldnpFNt/DyYrs4FAKpLZ7nKd3tDWRgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylrxoBxFwnk2yANtjwjEjXnbHaJ1o9l2fslIyxj30SXHFx6TMs
	HeuEBT+sx+0Hsqta70mP7vlQUbgNd3HEpVPSmOb9xIe14JkRe12xKyqe
X-Gm-Gg: ATEYQzy7mWHQ9+CpK5JMtpiwSETfjLz2Pp9tMjBNYhtlA7FNBi9jSi7pZAH9XaaRGmV
	Srui0/O3cDtOAgQwTjUcfDsf2cpQ79SmjX+A/Y5rTfWYbVAAsQMjcWREwkKy21UIOWUtxfZQLPo
	Hpm/2W0R5WBvl2/fJDpIzbTY8WpbtmMBp+Cxun3UZ4vPGqC66MXUNOLCeOxAiiBCenO7ISWT9+R
	d6U0YzmVrDZNp+WAbKNnvuJRmJFCjfTqlRqDjh0AWEmCk7IVirsy4TGDk04SvqjpnEHm4PS+KL1
	sSBkk8/9AJtrb2Y4mozldrvYrXar1XHBESzWkBwORIhqnlzkwlKmkupUEF6eq/R12c8h+ROZ9G5
	FozzCkFbCc2Ysd9k/jJutQzbGmnBa3SFXck6TQIVDrKdTLIiv4I2dHnLd1UFgH6iZ7wG/r3pqkC
	s7fvU+BQ6Shw5a4hQn96Ljgy5ckKS73O50wUOzv5VxqLEI9iO74MquJWipqC2XADP2sP9Aw+Fcn
	Ic8iU5U1BCMvSE=
X-Received: by 2002:a05:620a:4543:b0:8cd:bfd9:e2a2 with SMTP id af79cd13be357-8cfc7f33feemr2140906985a.43.1774317908192;
        Mon, 23 Mar 2026 19:05:08 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cff5d486basm50081285a.45.2026.03.23.19.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:05:07 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:05:52 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Robert Mader <robert.mader@collabora.com>,
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Message-ID: <acHxgIsyPiQTeqCB@rdacayan>
References: <20260217002738.133534-1-mailingradian@gmail.com>
 <20260217002738.133534-8-mailingradian@gmail.com>
 <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349f725-a20f-4935-a829-208c8e583ad9@ixit.cz>
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
	TAGGED_FROM(0.00)[bounces-56793-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,collabora.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,1a:email]
X-Rspamd-Queue-Id: B96C5300FE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 07:26:47PM +0100, David Heidelberg wrote:
> On 17/02/2026 01:27, Richard Acayan wrote:
> [...]
> 
> > +&cci_i2c1 {
> > +	camera@1a {
> > +		compatible = "sony,imx355";
> > +		reg = <0x1a>;
> > +
> > +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > +
> > +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> > +		assigned-clock-rates = <19200000>;
> 
> Extract from #sdm670-mainline:erebion.eu discussion:
> The imx355 can operate on 24 MHz (on both Pixel 3 and 3a), but Linux kernel
> driver can operate only with 19.2 MHz.
> 
> I assume it would be worth it mention at least by comment here.

This might set the series back because the devicetree isn't meant to be
written for specific software, but it's included in v11 because you
already asked twice.

The frequency could also be stated as having "better software support"
in general without mentioning Linux as the reason.

