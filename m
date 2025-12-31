Return-Path: <linux-media+bounces-49770-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56835CEB094
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 03:19:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 104F23025A46
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 02:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3922E2DDD;
	Wed, 31 Dec 2025 02:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BnsauaT3"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2E583A14
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 02:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767147590; cv=none; b=chmiZ2hajPjLy3ulboOBCjiwkQWL18k4zWoyM4YkSPQyTyctUA48sRqmcQGYuW3fGMWLqRQRcltYN7wKYj1pie0hb+wquwpAoRkdDSns3UGemeNjyuCr27SffwWeolK45b49m0VornPOIoYfUkveSJadLQRFfwX/C1er7Yplc0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767147590; c=relaxed/simple;
	bh=IHEnzGZQFu2XY1gud4jw/rHZMO4chA7VKbL2h44E930=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uUcGE3vSikFbkq+Foa4HBbsZ2e9zGgf8AkF4kHAkPYxwngKud85rjfIArsBBbFT0JwD31GijN2GqBUJZo1l0PcUyTmJuXIPj/pjPLocFM1wVuHGb6xmr1YlYKXcZW/ZxS+hyfCzugftrUdOeF/brR2sxg1JIPt12+dnPWbIYX9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BnsauaT3; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee05b2b1beso114154681cf.2
        for <linux-media@vger.kernel.org>; Tue, 30 Dec 2025 18:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767147588; x=1767752388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D0kfkuwpnrgAV1ePd0vpthp8gNZsEbHuzyj1n/s8Aq8=;
        b=BnsauaT3LcB6qSDbqVFDLxBkyxmSp/tlL/iHVaCiQiB2Hzx3UOKViFGX/3aQz2bRvj
         6E3UsUhB6dqklXjUTWahkmqh7I2cO/ZOAug249Db+Mvjw9EmVaUjdmLLwFefVyey62P3
         n5qqu1bLHSd074R3Aq664ovJaKVrWnj135XIbwLyz0fi/b86bhQ0LfwGaktgnA3H7jv8
         GrVTbWfEVsdLz5exxmh5/kreph5aoxa5/WCVyUo/uXxJ5rrQpWGPynfMRrXkO0pr2Pn1
         b0zklJL+OJYvsFta+u3XTbjnkcwchITee6pUwZcO/u0ksCDGTlAs6Mtbi3PqqrAuiEmH
         82VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767147588; x=1767752388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0kfkuwpnrgAV1ePd0vpthp8gNZsEbHuzyj1n/s8Aq8=;
        b=WRH0KtyQz3Fima/fQbm/xoeN6RHDgGNKS6DEx5TavaHOoZvsHgE2TYVfQTbQP58+Wl
         ELY/hoor31JwfVerAvYgNT0a6X40lXCy078E4YqIIZcul7RIP/YJBpef/ddJdC3QJpnl
         onwvhwd9epCA0SeflFR6DZMu0sEqHTaVuArnJ4M5C2FdLPrlTrujOz1XGn8SPFoGPeii
         ptjZusEsuxnk/Re4Odc1bJA3igEWbEw7RaawmpzXJgjatKEIQxWwlfsDz3uQsyCm/oIx
         deF4E3ap/PHiI+2tshf42iP73cgdmCK1jthSOdrcra4skSkZvhGi15+GDMC36VoYrviW
         sLTg==
X-Forwarded-Encrypted: i=1; AJvYcCXwiN6Df3kJjmtVeN23BgI2uMdBYS1p7/obhLyontRSGrM/ZLNygTlXQzuDG4VbaTL/ngvdbF8ZCU9J4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn0Zr5wXQnDm8nuY7Yl5wwaXb/QpFyzYjKxwk9w8dzs+iZ5TlS
	g5hpMy/7Kzi8NYsbgwC6qyR9TNpwESb4G68riNTZbYalVRvp8MlU5J89
X-Gm-Gg: AY/fxX5mhbKfsk2lECFxa4ZRIqM4shgLkadOib4DOznPvy84EUPzs58fPVLztEUc3Rj
	U8eSkJuj+zfyAiAk5LN1doQBDlPMUpWZ3/R61ZW4H/ugJEMmry9tbNAUZQ/IPQDDykMHGFmiSXi
	mXs8RzXXKyUYBpr53vJYdkp1V2gh9CfKHijlFz/fdbv/CCKMLhpTIe/ZJM8STobXiAxex1vMegM
	ITTHbWlGzjMheRz0Sz9nneYM6T/pIMLlFoSIOA0Uv/nuV+ccZygjCaoLofUblDxDJxOQ1n9VVFt
	IGnv/9nwCS4O1+HyAt/5wqXkqW3fEBlBcj2pWVs8cZFuBy3+PHAPBX6efkp3lID8zCpnF/7xtXt
	c7ZYzv6qoqg7U156CpuLDc+YF6qu9YLwWY3OQzEdJ7TORAAQe8pHcOTeQx6y6pguJCK30M950oC
	qqMA34ZZ0C6fu/CECwfP20dcCeV7nmwhaNljG1GQ+7F7cD1IBCmQ0nbSMSkz2Rna7lXbWyr0K1v
	wTvv8bqONH7Xw==
X-Google-Smtp-Source: AGHT+IFXTMpDXyFdEmEGQVX2R+AnY9cpX7S8SyoKdnFEwTMNIZQs9zv+GdpjMX2DjoIlXn0g3yozlg==
X-Received: by 2002:a05:622a:1c11:b0:4f1:e0fc:343e with SMTP id d75a77b69052e-4f4abd4c1b5mr608331051cf.37.1767147587668;
        Tue, 30 Dec 2025 18:19:47 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac65344bsm252694831cf.28.2025.12.30.18.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 18:19:47 -0800 (PST)
Date: Tue, 30 Dec 2025 21:20:16 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: qcom: camss: support for empty endpoint
 nodes
Message-ID: <aVSIYAC3DTD3dneW@rdacayan>
References: <20251230022759.9449-1-mailingradian@gmail.com>
 <7b1b0259-90d4-4e7c-8bc5-01e22c371e24@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b1b0259-90d4-4e7c-8bc5-01e22c371e24@linaro.org>

On Tue, Dec 30, 2025 at 09:40:14AM +0000, Bryan O'Donoghue wrote:
> On 30/12/2025 02:27, Richard Acayan wrote:
> > This series adds support for empty endpoint nodes. It is currently RFC
> > because it continues an ongoing discussion on how to selectively connect
> > some CAMSS ports to cameras and leave others disconnected.
> > 
> > The SDM670 patches are for a full example. If agreed on, this should
> > expand to SoCs that have CAMSS.
(snip)
> 
> I don't think I am 100% understanding what the intent of this series is,
> i.e. at a high level the problem you're aiming to solve.
> 
> Can you elaborate a bit ?

The point is to move the graph nodes entirely to the SoC devicetree so
the board doesn't have to redefine it. There is an explanation in patch 2,
but the next revision can try to cut some of the rambling and also
briefly explain in this cover.

