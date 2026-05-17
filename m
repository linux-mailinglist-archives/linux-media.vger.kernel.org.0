Return-Path: <linux-media+bounces-61842-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHi8IhaZCWqqhAQAu9opvQ
	(envelope-from <linux-media+bounces-61842-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 12:31:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F6D5607A5
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 12:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B8133003809
	for <lists+linux-media@lfdr.de>; Sun, 17 May 2026 10:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF56C35F16B;
	Sun, 17 May 2026 10:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNMz2mf1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A6C317144;
	Sun, 17 May 2026 10:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779013897; cv=none; b=DtFn2+lvcxRpA1LCUltEYbVQFjj/GJOZybQaN1ZqHSSGusYFVT3BiZkNEdKyILqTom/ZepiSKFU/8w0K9o+gy+vUUiytw2u5pPlMJsKgwEUp7tlUVrqxa1WtGu07v8DLSMbYnj/2AzEV54VAHSpvhdFQhGKVAtuuIWiXrp09gp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779013897; c=relaxed/simple;
	bh=2LoNGLxKpbNGIlnyuD9F+D4BlNWTV6SYStdZR9yqZUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uaeWthAwQm+qfIJ+FZSQhUXuuLxW8+FwH3taH6huvb7seklM0dRBIgRlDQCv0ymh2oAFjzpbzV1a/XkPLR7LoOht9Iq4K86E/xLZu+utQ2tDpf6hCk6UUvWRkkgkEZ2DCRgtXDkqY5pz6/Ku/LflMVxcjWzevqDcuCx+919oF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNMz2mf1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEAAC2BCB0;
	Sun, 17 May 2026 10:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779013897;
	bh=2LoNGLxKpbNGIlnyuD9F+D4BlNWTV6SYStdZR9yqZUA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WNMz2mf1VpPRCTtY9H10C+qTaWBOmOLZGW4Jf2AJpDRAy+Fp6lrt80taEgZ4ZNJFu
	 p7xyDtLuSg4euxrKZA2FsacgMEj8TLxhXZ2hZicRTc0PKMvmmgWMR2eIv8oa8Kxh6L
	 eZoym/Q9rUXn0m2rxw8S1Qgrxv66QCoij+4yu/tJ94nf1rK3RXFJAgS+pQs3PAoCMJ
	 ejrm7dyUyXdCGVxTScOYKVby2nloZUrKxTkSzn+7X8njgAShu8XYv11cz4EYXTKnyA
	 hbnx2vpbhJHIIFOUBlXYE6rELfYIiOB2C0crbfnUZQPkWOt/0r4+eSSOKBA4HqfJFM
	 F6U7uL5onZoAg==
Message-ID: <759def4a-df59-499a-b21e-c441cc7c2fe8@kernel.org>
Date: Sun, 17 May 2026 11:31:26 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: dt-bindings: qcom: add JPEG encoder binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kapatrala Syed <akapatra@quicinc.com>,
 Hariram Purushothaman <hariramp@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
 <b7u5v5a7DiYm-NowQSavDCjDEb1bGE_S2Z5LPZmIlMx5ve25F7067cdVqRJEeuUoTl7pHVr98FuOry9-VR5cNA==@protonmail.internalid>
 <20260515-qcom-jpeg-v4l2-v1-1-f38c2e1b3555@oss.qualcomm.com>
 <f4159f41-8a06-40a6-919c-5e16314b1732@kernel.org>
 <A2T8fauV7R4twws2HDH2W_vZj6GDoKtgWiUAGP4yMPaMp9dVxoD25Wn7xBQ7sqTI_fV14Y9SCmN-j160CrMDJQ==@protonmail.internalid>
 <a39b5e37-72b8-465a-b6c3-65415eb577aa@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <a39b5e37-72b8-465a-b6c3-65415eb577aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A7F6D5607A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61842-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 16/05/2026 21:16, Krzysztof Kozlowski wrote:
> 
> Bryan, before you waste more time here - you missed announcement that
> this should have never been posted.

I read that after doing my review.

Sod's law.

---
bod

