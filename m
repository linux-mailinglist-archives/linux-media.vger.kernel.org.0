Return-Path: <linux-media+bounces-33408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906D6AC42F7
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 18:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 390D07A1B3E
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 16:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3784723E324;
	Mon, 26 May 2025 16:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b="S1aSAhzA"
X-Original-To: linux-media@vger.kernel.org
Received: from mailo.com (msg-3.mailo.com [213.182.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C591BDDBC;
	Mon, 26 May 2025 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.182.54.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748276611; cv=none; b=JVokJ0njE7iW2V4l9dHXuXCS1QAl2GNd4sWikqCLuHeMGqg9RYpgQ33qvLQEau9U+7DAMe/zqVO4ziGVW1vNUwB8WcSjHIglwTlF0ZKWpMASJumDL7sK6iyqZ4SPlVfKwfZYFCt7xEDl7q3/HHhjad83S68tw2W8DhjgvS5FOyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748276611; c=relaxed/simple;
	bh=4N6gJ0FhNDbJX77zeO9xz/HC/fn9r+8rYWuBbn8xDcc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ob8Zsq5gR2gKVt8KL7lmefvEiS67N66aiDoQqZIngW4+HVNLjVq6Y0UMLm0kgCVIujMzBCBQthIbJlpvFCu19GNhB5MFD54CWvnkeBYEO4wgFMTCHvhvx85Y4COljQbsz1KJ9nwNKuQbCL+ckEvWHtv93iMxPp1y3NKRDdC4G38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org; spf=pass smtp.mailfrom=mailoo.org; dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b=S1aSAhzA; arc=none smtp.client-ip=213.182.54.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mailoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailoo.org
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
	t=1748276595; bh=4N6gJ0FhNDbJX77zeO9xz/HC/fn9r+8rYWuBbn8xDcc=;
	h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=S1aSAhzAk6CIQN31Ww4v79nHUmmiiv6O7zOYTfldRjY7tbl9SFLpT0FrSLQKYRDAV
	 WQy4ZIxmngqDWeEUbaNnxhtEdhPl4TdrzEXAFBU9EVbLqJPmli3VvOZQcreUegZd2L
	 jj/V75c0e+gg+MsjMoGW/VYicTczIBF/pSMVpxDs=
Received: by b221-1.in.mailobj.net [192.168.90.21] with ESMTP
	via ip-22.mailoo.org [213.182.54.22]
	Mon, 26 May 2025 18:23:12 +0200 (CEST)
X-EA-Auth: AJCTH2JAplmk8gUgYuFTOwwgdqiQXiBIr8EzluI+jeWKbd5bKjFL3G5CZAe28NCuq4IqybX+zBfuBJTqkNrQz0cTl+JwGPG1RA4IO3nXuME=
Message-ID: <4688737b90f26ce56e7043a006f25e28cddc928a.camel@mailoo.org>
Subject: Re: [PATCH v2 1/4] media: qcom: camss: vfe: Add VBIF setting support
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Robert Foss	
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn
 Andersson	 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 =?ISO-8859-1?Q?Andr=E9?= Apitzsch
	 <git@apitzsch.eu>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Date: Mon, 26 May 2025 18:23:11 +0200
In-Reply-To: <e8750bc1-11ab-480c-a0fb-262ff6a0dd22@linaro.org>
References: <20250525-camss-8x39-vbif-v2-0-6d3d5c5af456@mailoo.org>
	 <20250525-camss-8x39-vbif-v2-1-6d3d5c5af456@mailoo.org>
	 <e8750bc1-11ab-480c-a0fb-262ff6a0dd22@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42app2) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 26 mai 2025 =C3=A0 09:13 +0100, Bryan O'Donoghue a =C3=A9crit=C2=
=A0:
> On 25/05/2025 20:25, Vincent Knecht via B4 Relay wrote:
> > +void vfe_vbif_reg_write(struct vfe_device *vfe, u32 reg, u32 val);
>=20
> write_reg() / read_reg()
>=20
> ---
> bod

Do you mean to just rename to vfe_vbif_write_reg(),
or that I should also add a getter function ?



