Return-Path: <linux-media+bounces-49834-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF044CED96D
	for <lists+linux-media@lfdr.de>; Fri, 02 Jan 2026 02:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EAB63009F86
	for <lists+linux-media@lfdr.de>; Fri,  2 Jan 2026 01:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B6E13635E;
	Fri,  2 Jan 2026 01:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rogers.com header.i=@rogers.com header.b="H2dvZkAY"
X-Original-To: linux-media@vger.kernel.org
Received: from sonic316-10.consmr.mail.gq1.yahoo.com (sonic316-10.consmr.mail.gq1.yahoo.com [98.137.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B416F28F5
	for <linux-media@vger.kernel.org>; Fri,  2 Jan 2026 01:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.69.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767316796; cv=none; b=h9/Ut6nodKp89NPHLFz7TXhYCVhn35p4QKb0gdplob7hpzxidzMmG5SjhlT+5ctD97pxyv7l53h3/3tcx5B+2pA0aE4+FigIyHs8iPlm672hY9GtbxaVsdID9F34OKkuNREYtAqUtmTlkFYXz612uUujYsIM7qKWONkhoXfCR1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767316796; c=relaxed/simple;
	bh=3sMkmG/f6zaWym78b3gZbqVlPxi7VRn2lEWZzwfgKuk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NdwIhRg0bMoR2RA5vYVMR1boWbE7FhLRdLSysRckajvdnW7M2RpYkgnZ+Xez+syTN9JUyXF7K7AJ6w3p6FRN++8fGvYLTUnVtz+CZfunP4Z4N1bk5aybG07jzGWxjPa5DRkzeyxoGpDqAigOzIEMb2vLCPGABOKT9NxCb6WVAeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rogers.com; spf=pass smtp.mailfrom=rogers.com; dkim=pass (2048-bit key) header.d=rogers.com header.i=@rogers.com header.b=H2dvZkAY; arc=none smtp.client-ip=98.137.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rogers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rogers.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rogers.com; s=s2048; t=1767316794; bh=/mclJI+EBCWo8ioXbLs87HMZLRYaOlftsXJYbvWteuA=; h=Date:To:Cc:References:Subject:From:In-Reply-To:From:Subject:Reply-To; b=H2dvZkAYzWVlDiGIQ6i/gA+BxKvuLg6yhCgZ/2Lx0T01HwwX+3HPTFq3I3x2rubzpfxjt29gXeiiMQ7ReXWhUFHQmXXDmT1mcp0mwUJomwliKlftm2Tv+Frjt9uVZbGSPizDcyku8kgwCPO6WqpX6s9wzC4B70UbwmDJMwThH0/YMmNO/WDDWeoh+61WRoqw003ySneVDarsRZh8YSzl4E1xDxv+Aun+/k/0muHuq6iA+NWx0Z3giUSywvaCIPFIPXLKRoRn3MahAZ8hoxWYDfSPDZJgx5wMv92QH4znAKaWTfZUor37tXtnnsflFvYxYcCubPNE3JmnSgvvE6Q1aA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1767316794; bh=7zBasFCOoFBe21wrco2mTMSp8gdn1nnAiCDZ7YB6/D6=; h=X-Sonic-MF:Date:To:Subject:From:From:Subject; b=CCAlFXWVHtTfZ9/i5ORS5ovcn5fdLCihPtojjfTaAnc2aZhnTNg5IhSvosF7yRDQQFH1pkjhMhObSoWFD6CDIj46gM9v15iYL+GZHRgk2gMW28wSe8TwKWdMJVc4Dya9opR8vmbNxi+NZrLKLKhHkWGjtd9gSEEuMxQz/1ZFUydhJtf2TMOGuLSgb/sUQW2PJWh8cjp0OBX+DECVKMQfs8YSYCwLIDSYfXgo9xWvjei9FTR5enUab05Vb7m+RJ+P7vyfK6Km6H3XOxw+u/vdgltLwpBELRc26dqzdGrtMfrT4lVtrrkFoFsw5YnNMvCMU6XBJG+wkQMURY7sMEwHTQ==
X-YMail-OSG: qBCQbxcVM1kftC6NqzKP.NlDJvu0Y6VWBH1ZGF_aFG66kW74875Rz2GsDyB0cjx
 c0zOMWKyL5rusgvTC1rDR1vUYGr7eE18He.HAmiz9BqMe5rlh2bF_Crvlre9x9GJ9R3XVyKYi24F
 i9XJQA08JfkCQFHGLkYWdTwkA8i0vLOcTiA9fQmgZqMhJ6d8ZFqn.hbdshrMhiBOZDZwfOPnw3JN
 qePHB0xnkcmrAaVdlHMViyhPCrdtBhjDVj22eOrsC0HchUcjXjqjd8Gz6TimP3K0VmNSBZZ5lwai
 bAKoLLR2Djfd6LIb7pi4D0K3rsGnd7SgcbWSTOy.U4U1ANAm9Lln679gH7mVtZF8Qi6z9vDACPJ1
 HjfbnAfJkCw5HL61g7N2UimGtEuwCwgx_rI4G7LmfvSe1tWWZuZGEtRwA8bIQUoN1mm9SJlZb8H5
 7jWGlC6OVPjHaJhP7GWB26MN23AComlz8tz7TcEMa44Psh0Uw2XWvLfKV6Uy29IMBzo0BTzF7bX7
 48r._ZW8IuRhecg10wws0fskxEb0u_IBmgiRhH1piwf0G6b659gZLKG9Dt9VQQT5wBMjdaVJkI1v
 QKqm09dIg85ERwusNFnY6QYYDheFWQltdqkqgRs1nUAjF_nu49AhCldLOF_O1cypysdCzTVF778g
 IMAP8zW9Cbs.AgWePGlrWX7Ui41z607zBwLaxWNGQt8rS4tYore9XzUk7_LM0sB6tsabl82POqvA
 9IPVaq0RMagbi8t2eum8t6v8FXkX5SSkWMb3fFvnqVBig69K9HbrdqInnjHVdjhfqvUO_Ct190uS
 sxGdv.mBEYm0fxvA641oYmbLc54AFUIqgN5kHpP6nOjQHjVFzoPZOPHfOi_3ljl7oDnSuV0gzRGN
 o.hSbSHAuWq_GKgvjdZmVs_7juxax6IWONvKFJf2x6pvwjW94vRRuGxoKnYassEncY1o4kTYmFim
 kYqy9Kmi.wuK_RrzD8gvLOmFeyh7FXndPQAnnJ7Zi2STMYHv17lIdIs_Vx7kgi4xQbRPznlyjy5F
 XLHdO_fUuODfcC_vMz2tE06IJEy7C2jVAGX6OR8rgjeGfQP9qMxzsNysI7tGUpSczuEyxs_SZk95
 4WXHJG7yh82fmBDV0wfJeJERahRsreP2F.ZFluAMG6RbKJ5vgjQ17ZUWOZXnhqE59aBiRZrudxCp
 GVw10wxrVbqWX6N8MXBpm_FLXWBwazNc6YNr6sfzZpmhw7Gq8SZuZ6psbT_qAN7M8rpVude4fmhO
 w5uSEXEEdiKdSGbwVC15Zcbdv6O16de2rsoT6p9PkDF6SYneFAe2cBeptdBE2hIyU2Oidq2oO20F
 RTU5TPRjz2ij0WHHIVFVYWRP25y8NXylAo6sHQGwtQ3_012raOQjpQWqu5tYTJ5cvDdfh0JL0UZm
 h6V28_uOzXgKRRmQrujNfDkbCov8oXmWx8ACtsPm2iG.o0qPXwM_6eP5Q1RHuIt04j4QS1CpColv
 .IEuE4rL1d3W6Vq4yB3eDySOLCCBM5CtZ_zdoKrz0qMWKNLJKCjaJvQyJd4fGwGePPHmDXIH6Dw.
 ALg8OiMhur44lSc3Lr2EmAGQCtMVAgbXnHHKbDXWSf7QnhfWrwr6Hc1X4qg5A0zlofbWhOWxA3dW
 afry1uUO.pGlHjGS1i1JzjnBpr4rtZ903s.vgDscDNrVZs.ABqtai.E.A8wiNP_FV04Ooql4aGPS
 eTRFe1Xpw1G19WSdveLOUByGQlpFFzjjB3q4rQEKftA8n6oaEd4PHNX9oz8BU3NgZcGMIMPeoBi.
 nBuEy41FE1i7nMfPZoSvK16kVFJLtXf4Ns25Q9HesFOActRHcfJNJI0LTV9mZleawST9WxpHIstx
 eRW7GRtf3nRRBiJMHR16R6k5IXf0D4c5haQtjDrMFMwHLHc5Ij9xm4Q3Gm8XyXjw80iEg9MuMs0X
 9cbiAs2mHxRebEFhcTz8QXVgkZF0JnJQ3ydK3WVUrEVovMXDt6Tqw2TAbfh64WPwIRT6Qtvk_4O7
 x7JB1RNYbgYWQ56NPJjJxTZEwp7Is1XGKAmRal_MGHrcVjcvVftfsuPuyiS1aop1a8CKG6svOk40
 G9e1SSFdNJ.PimvCmcwPg0VZDBkCJkV.09Pj4L2H0s7P7yU3RcCPea8LiFyfFXulKlM2XlfRMl6_
 _KFomhGC54P09NnM2LKE53FgCakkUJCGe02zUN5LHgzvKYY9_BnReM.KYc7JHeYNgpZR0Bv06jsC
 PrNpcaoUm2iWAJqYvqiGkuHdSKC8-
X-Sonic-MF: <emveepee2@rogers.com>
X-Sonic-ID: b2e0a9c6-670c-4caa-b03c-05a3b10e033d
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.gq1.yahoo.com with HTTP; Fri, 2 Jan 2026 01:19:54 +0000
Received: by hermes--production-bf1-55f79789b4-dlqhd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2dcdad2462d1b00971dad00a8e4cc42b;
          Fri, 02 Jan 2026 00:49:32 +0000 (UTC)
Message-ID: <104e2223-aef7-4c5b-89b3-762365a03ec8@rogers.com>
Date: Thu, 1 Jan 2026 19:49:30 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-media@vger.kernel.org
Cc: r3o2c7fi@duck.com
References: <20260101224231.486-1-r3o2c7fi@duck.com>
Subject: Re: [PATCH] libdvbv5: modify T2 delivery system descriptor
Content-Language: en-CA
From: Martin Vallevand <emveepee2@rogers.com>
In-Reply-To: <20260101224231.486-1-r3o2c7fi@duck.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.24866 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

I have received the attached and I don't have a clue what it means.  If 
anyone can help please let me know.

Patchwork Integration <patchwork@media-ci.org>
	
6:30 PM (38 minutes ago)
	
	
to me
Dear Martin Vallevand:

Thanks for your patches! Unfortunately the Media CI robot has not been
able to test them.

Make sure that the whole series 20260101224231.486-1-r3o2c7fi@duck.com is
available at lore. And that it can be cherry-picked on top the "next"
branch of "https://gitlab.freedesktop.org/linux-media/media-committers.git".

You can try something like this:
     git fetch 
https://gitlab.freedesktop.org/linux-media/media-committers.git next
     git checkout FETCH_HEAD
     b4 shazam 20260101224231.486-1-r3o2c7fi@duck.com

Error message:
Trying branch next b70886ff5833cf499e77af77d2324ce8f68b60ce...
Running in OFFLINE mode
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
   [PATCH] libdvbv5: modify T2 delivery system descriptor
     + Link: 
https://lore.kernel.org/r/20260101224231.486-1-r3o2c7fi@duck.com
---
Total patches: 1
---
Applying: libdvbv5: modify T2 delivery system descriptor
Patch failed at 0001 libdvbv5: modify T2 delivery system descriptor
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: lib/libdvbv5/descriptors/desc_t2_delivery.c: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch

Trying branch fixes 27afd6e066cfd80ddbe22a4a11b99174ac89cced...
Running in OFFLINE mode
Analyzing 1 messages in the thread
Checking attestation on all messages, may take a moment...
---
   [PATCH] libdvbv5: modify T2 delivery system descriptor
     + Link: 
https://lore.kernel.org/r/20260101224231.486-1-r3o2c7fi@duck.com
---
Total patches: 1
---
Applying: libdvbv5: modify T2 delivery system descriptor
Patch failed at 0001 libdvbv5: modify T2 delivery system descriptor
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: lib/libdvbv5/descriptors/desc_t2_delivery.c: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch



Best regards, and Happy Hacking!
Media CI robot on behalf of the linux-media community.

---
Check the latest rules for contributing your patches at:
https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html

If you believe that the CI is wrong, kindly open an issue at
https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
to this message.



