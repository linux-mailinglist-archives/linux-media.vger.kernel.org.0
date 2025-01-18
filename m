Return-Path: <linux-media+bounces-24886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE4BA15D46
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 15:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66D5D7A2F9B
	for <lists+linux-media@lfdr.de>; Sat, 18 Jan 2025 14:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4BE191493;
	Sat, 18 Jan 2025 14:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b="0C0ceBvP"
X-Original-To: linux-media@vger.kernel.org
Received: from mr5.vodafonemail.de (mr5.vodafonemail.de [145.253.228.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1EB1DFD8;
	Sat, 18 Jan 2025 14:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.253.228.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737209218; cv=none; b=KuKLvGJ9tIbYa6tWfhTyk5v951PmTJDtwxHLXqP6xNufxJXjqA+1/1Uxb3iN0ofvR5NlcifRSV0UQNSvD2Sj7KtEz/CTYzAxeHk6EijdJLW2KsngVCLt1lwfqdY6j3YMm/lcxK47uXEieJn0P3d4Psi5ge9dB0tisMIw1e//INk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737209218; c=relaxed/simple;
	bh=RVvnfTDp01MlhpI26x2/hI9B5JSXbnxAwAV9E0d5XY8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GzOnVY0cYOps9qFikMkQw5LF8Y+IJEdNJVUfbe01oWLx9casTpoV0UyhnHn1c3YxXHVd4eprhmqlV1S6hlFsGW90Yyl5Y6OhTpDitm8DIgiK0UnmnhR6USZ0DNTja0Tpej/Tn5o5Q173v0dVcHIf/2j4jBuTsVJBV6KRRy4j7MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vodafonemail.de; spf=pass smtp.mailfrom=vodafonemail.de; dkim=pass (1024-bit key) header.d=vodafonemail.de header.i=@vodafonemail.de header.b=0C0ceBvP; arc=none smtp.client-ip=145.253.228.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vodafonemail.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vodafonemail.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vodafonemail.de;
	s=vfde-mb-mr2-23sep; t=1737209213;
	bh=RBRs8NO8mDDz1slYP5Y3DJPxkb3HfvCBj+zdT/eAgIM=;
	h=Message-ID:Date:User-Agent:Subject:From:To:References:
	 Content-Language:In-Reply-To:Content-Type:From;
	b=0C0ceBvPkByMjpHdnXHCgH7ROtPxYNoKthsbB8ZOjqKkv9exFhDqwdwVhRAnjMYIK
	 yDLfPEO3VHW756QufwyyFg8pifRg9m4M1QrolnIPD/c4T+rscJUexqzfjtlenWfxhy
	 N1/AnUNJO6B8lJFIY22Kx2cbPk4+sRB4HvYE7Dso=
Received: from smtp.vodafone.de (unknown [10.0.0.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by mr5.vodafonemail.de (Postfix) with ESMTPS id 4YZz1T3JFKz1y2l;
	Sat, 18 Jan 2025 14:06:53 +0000 (UTC)
Received: from [192.168.178.41] (port-92-196-23-234.dynamic.as20676.net [92.196.23.234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.vodafone.de (Postfix) with ESMTPSA id 4YZz1C6pshz9rwC;
	Sat, 18 Jan 2025 14:06:36 +0000 (UTC)
Message-ID: <53093f36-9287-42ff-b665-f6b9cbdf60d5@vodafonemail.de>
Date: Sat, 18 Jan 2025 15:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Frequent kernel messages related to IR keymap rc-cec with kernel
 6.12.10 and HDMI monitor
From: Farblos <farblos@vodafonemail.de>
To: stable@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-media@vger.kernel.org
Cc: regressions@lists.linux.dev
References: <6555309b-830d-449b-800c-55306c19c659@vodafonemail.de>
Content-Language: de-DE-frami, en-US
In-Reply-To: <6555309b-830d-449b-800c-55306c19c659@vodafonemail.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 839
X-purgate-ID: 155817::1737209209-D9D10466-A114AC44/0/0

More information on this.  I instrumented the sources to dump
stack traces when these messages are written and arrived at
function drm_dp_cec_attach.  I further instrumented that to
dump the values of the expressions involved in this test:

  if (aux->cec.adap->capabilities == cec_caps &&
      aux->cec.adap->available_log_addrs == num_las) {

The result was that every time I have

  aux->cec.adap->capabilities == 0b1101111110
  cec_caps                    == 0b0101111110
  aux->cec.adap->available_log_addrs == 4
  num_las                            == 4

So the capabilities differ in CEC_CAP_REPLY_VENDOR_ID.  If I
clear that bit in above test, I am back to normal, getting the
"Registered IR keymap" message only once during startup.

Could this be related to commit
613f21505b25a4f43f33de00f11afc059bedde2b?

