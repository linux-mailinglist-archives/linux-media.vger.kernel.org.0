Return-Path: <linux-media+bounces-52549-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tNMtO8Hli2kcdAAAu9opvQ
	(envelope-from <linux-media+bounces-52549-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 03:13:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE87120B73
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 03:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 069A6303BB37
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 02:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96282FD1C2;
	Wed, 11 Feb 2026 02:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRzKVKuc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4556420D4FC
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775994; cv=none; b=HlPjT79RK9jQHuKQYCm3cGfbUBVdVPrh+0Ig7IQ1i4RxvQzihk1uJ4CLkA7hk+ORNjpKjpJoAv4mQYa3U8TlYeAtPHh1BcnrG+D5ZXiuhjNObEPN/M3mCo/Yu2C85YTI0vVKLS0sr/iUwwCbZT4SBK97FuJUVFs0bejRLX+pDz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775994; c=relaxed/simple;
	bh=A1SS4TKzzKgvQKNJqUbY09euLXdjy02UR4+Fo+uBiuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mkEtSC6UEunkMqIgb37hZwVc+8Ixa2SZOeu9a6wuia16ntGxIvC55GVvM5/WSCiCGMq/zem5C1Hb8bUI0OLEYNUW7cS3HcGrhPAfrL/a3PrsGlkULRpDejq3olWN4qdvIVO8VuMBjaHI0Z0JSvuJa5QkT7awyAR3kZp0IlAuDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRzKVKuc; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-45f053b7b90so931703b6e.0
        for <linux-media@vger.kernel.org>; Tue, 10 Feb 2026 18:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775992; x=1771380792; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gm/euDJIj38jkfPBdt87UcAMoKQj5lm4rAH2NrGeusg=;
        b=FRzKVKucgq55O40h7nfE942km7AYPDLdI5KMKRP0WTVJoSn7tzjwQFtfonvIguofDW
         nddki2AICPMlMFNF2XpnZX83TLXPydIJBbgQXgvLLmo+G0vs4RYGaHQHDen1G9X0QDkm
         xCcXlrN7RQ3FK9nhO9PnUS5oYMZ9x9rnEaWgIZ9ggqOxvTyZy4pp9j/lEckdVeJ96kYn
         ipCjAZtMe1EIXm47EmjeJDprlgk+Oao1/31xUFKSqROsqt4ShfzvbdxNec/iZAUBFV+z
         gALvKlHjLuTuVc+fdcXoEu/XdHfHzAzoucmzMxnW+j3/xRPzjWOhDnk8SFuOEc6t8qRa
         v0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775992; x=1771380792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gm/euDJIj38jkfPBdt87UcAMoKQj5lm4rAH2NrGeusg=;
        b=Hv0mpQLrgeB2yqmBci5AiC+hzzz5V0SNOzil6xU75oXrs+iAZOoMkesb4pIlnAwPOj
         q/3Kmvd1TXORM58QE6py7hXPr8eGBj5zt7o26gPZYXaM++n26TAMh2fbphTFKg/YAMY6
         O8/Zvw5u1JREPGGUcww8fW3yOQpyCPMuoP8uaqHgZ3XwuFYVndAcOuYBnUT5lfmozg74
         tixAlrgIhgkZEhATS573Gyky+SWCG49EAjvLvfWqu1r71jZau3VRJNYWtL/CBz68aUyq
         1462dOLT8ih37riM0TN7sp4/ji8VCRSp9235yolUAEOspp91xwDkkwtt7/ZIJUddi0uQ
         lbHg==
X-Forwarded-Encrypted: i=1; AJvYcCU2KZ+i4gh5/hLXIE51Avu4eqZvvWGA5Vbn2Ti3PEgVKJ/nYH8l+y3c5oxPL+17YG+bSYEzAyvqy3IJsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtFGOlE+vAJ7ocJPPlh6rx80SPWeZl01oOAgCJf4dEYq8zxFNb
	OmV7Wlv/nmMQYZFwUJMeAxWB3cT6pSnczXEdUoBm+qCFwBnmJ0V4YXil
X-Gm-Gg: AZuq6aKnWh1cBvnnG6H7HCMuBsjLrP0N1H8tZVFiU6HjfQPwMh3ZDhEVtbSNqY6IX2W
	PqPYrj1ZxAYwpC7KiBAZFrqxy9GSA//S2kGeIBAcY50+G2ilQw5un2rOxOaHf8Va8dXUDcvGqCy
	ZcjxK9sZnX9ZdMHcxFUm9WikdpynYGnT4h81rHwDl6qkj38nTnw1Mq9/xowRteX6EQJhcf1paAe
	3l0JU1cCqxE7xqKtxX0gZo7WF9qxAF8H5AgO0Vtx1Cj3Fiq0F8temnrX/324lumg+/G1Mgfaw8r
	7tkSF2JTfIWxLhyrh1ql3Sm5O9ggfYvYWLoHP8mC2s0V7A5vSPvDsG9TlN4B8MNlrbt92Ptvsxf
	S4J5qksdMyZSJ4cvxxFu5Ez1YLf27+iKbywSeokvDMdTmu0diQrh0AdN8JuP8x5kcwafNpp7rGC
	zvARQwdO1G8vi28iGiWkQZlto1YA==
X-Received: by 2002:a05:620a:1789:b0:8b2:eefb:c898 with SMTP id af79cd13be357-8caf2389cc5mr2130416885a.69.1770769291885;
        Tue, 10 Feb 2026 16:21:31 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc823a4sm1881586d6.8.2026.02.10.16.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 16:21:31 -0800 (PST)
Date: Tue, 10 Feb 2026 19:21:58 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
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
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v8 0/7] media: i2c: IMX355 for the Pixel 3a
Message-ID: <aYvLppaYsNDDD4DX@rdacayan>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52549-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4AE87120B73
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 09:01:59PM -0500, Richard Acayan wrote:
> This adds support for the IMX355 in devicetree and adds support for the
> Pixel 3a front camera.
> 
> Changes since v7 (https://lore.kernel.org/r/20260117040657.27043-1-mailingradian@gmail.com):
> - restrict data-lanes to 4 (4/7)

Apparently the 4th patch has been blocked by Gmail.

