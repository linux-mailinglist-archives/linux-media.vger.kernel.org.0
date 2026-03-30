Return-Path: <linux-media+bounces-57637-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIGVLv2Kymn09gUAu9opvQ
	(envelope-from <linux-media+bounces-57637-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:38:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E32935D021
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 16:38:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A7518302E572
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 14:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0412E717B;
	Mon, 30 Mar 2026 14:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFMOA622"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B702D47E6;
	Mon, 30 Mar 2026 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881179; cv=none; b=YOgzKLUQydACrAaYCI+koqgeSmMm3u5qddgW7LyfeigJKHkoWSzPiiPNilB8b9OLyhO2y4HbRvc41uiKrYxtK8eBKRjcrOjy8xxNy1v1P09mwhIhAv4jA3tkHmDHdmCcb9ZegmE5XxdotQ9ZutmHgGA46WkVxygxN9/JupF08hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881179; c=relaxed/simple;
	bh=xjr7kjou/tlAs0NhQalT16hEuisWbUPGKwa8r2BLoUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFjtaRPAEtjeNttFh0NPKWnAlsJ+hjm6a9rpWgsCGGKTxGHnjb/pjHVWrnjLHQLp85KfemAUgCk1xbzAUSCZf2NEluHgc3dPU3Gct/nkDy81tL+vItEGasmGYYDNbqHwUPX/o1xTFUtycV26/zlcVXMa4No6QbYBksrRrT76PHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFMOA622; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F48C19423;
	Mon, 30 Mar 2026 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774881179;
	bh=xjr7kjou/tlAs0NhQalT16hEuisWbUPGKwa8r2BLoUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cFMOA622GQDBbIbb7ykclQ78rkJ9Ui7Gd5cavChoATHqusu9WCtXerl+YgM1ePZ5L
	 8K5CFq/Ovav042bPqAY/Y7UsFTMQWfPwQu0JZ5uiF+ln+QcVa72a1irZjXlgt17m9/
	 a7BhqN0tlYSyw9RzED3n6zaPfYUk9gU2KsZZfKnuKDOqkfmpGN4VpKE9KmsJvHBKz4
	 mrYcu5DG/3JvZH5PFLp4Xx/PjIdd7yf+TK192FygAXxXILhqxaolyEI/PpIJ3s8pQK
	 mfimSHvzxhIxRKQPYyWtn7HFn4O33Y+hTFHPi8sDu8b254uuNZVOeGs81bJ7+dW5Sb
	 up7fbuzzkOK+w==
Message-ID: <e2a4e9dd-6a45-48dc-8757-244e201dd4d6@kernel.org>
Date: Mon, 30 Mar 2026 15:32:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
To: johannes.goede@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 vladimir.zapolskiy@linaro.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, robh@kernel.org, krzk+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mchehab@kernel.org
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
 <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
 <1ba54ec0-be51-4694-a79b-f272e76303d2@kernel.org>
 <X-Lw_zi1o015-V1Cv4dY_ik6SfTB8TTcLmn1l-Ta7UviYTJ6gwMBn4B4ulYwjd_Aetul5xUt0T6ln9E-Hl5h4g==@protonmail.internalid>
 <CAFEp6-3ziXJTYADOFj--rZL5TumroXuW+=SnUQ9XakRxHT-ypg@mail.gmail.com>
 <12194cc0-0960-486c-be7e-1a22d95de340@kernel.org>
 <rj2vb725he4yzfvjifzyxqpbqk5oztfaafp7sg2qes4qz3mlaz@z5dyoqod56d7>
 <7fc31426-3157-49c7-a30d-dcd7b181fcc6@oss.qualcomm.com>
 <qq43xl3lsv2nq4ngn2hojleddxjmkgwclb2ajek5gvdtgyjltl@3tqg5ydhsxia>
 <8DTHyPLaUjGKd83PvBsisjn_SnpUnvkateTtwz9P6CChP9VGfDyQmJa4Rfd5KwOBOLhtGFJPDzfHrXC4zvV-Fg==@protonmail.internalid>
 <0330f63f-7137-4484-954a-fc0776a9b052@oss.qualcomm.com>
 <0879e4c1-5381-4a70-9fb3-4af9b3bf6e48@kernel.org>
 <0RTUgDf1wbD0phPk8qAcojZovgMA_68R84FRaL_BHfjzupSA6c_8S5ogVerViYPFNJtvup9sOvL_uPx2t6-KCg==@protonmail.internalid>
 <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <2e4c4641-f631-48fa-b5dd-6efd70110dd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57637-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 5E32935D021
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30/03/2026 15:27, johannes.goede@oss.qualcomm.com wrote:
>> That's another reason I bring up CDM again and again. We probably don't want to fix to the wrong format for OPE, introduce the CDM and then find we have to map from one format to another for large and complex data over and over again for each frame or every N frames.
> CDM is a much lower-level API then what is expected from
> a media-controller centric V4L2 driver. Basically the OPE
> driver will export:

My concern is about wrappering one thing inside of another thing and 
then stuffing it again back into CDM and doing the same on the way out.

There are already 50 MMIO writes in the OPE ISR, I don't believe it is 
sustainable to keep adding MMIO into that.

I'm aware of a project in qcom that did something with making the CDM 
format in libcamera and handed that off to kernel, recommend looking 
into that.

---
bod

