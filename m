Return-Path: <linux-media+bounces-63019-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI+oFGNZGWqtvggAu9opvQ
	(envelope-from <linux-media+bounces-63019-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:16:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B926A5FFC84
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 11:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2450C30ED0C5
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2026 09:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C66253BD643;
	Fri, 29 May 2026 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ga0EKb6V"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D662A3BC673;
	Fri, 29 May 2026 09:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046006; cv=none; b=XrRUyOU7VZF4Y9wIHo8y+ku6RmTTsJBRNmqSYZ+5Pe4KnjKkbxtRaNMvMJPLizPRILCixuxniGLYQiUiDMXn7nO2Pr7P4AwbVSjF5OAiTG2sHleuFiZ5HXxhhz26AWTgixdoUBJSPWz1MTvNRQikMnX15aRu2chulLfzTAVkdvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046006; c=relaxed/simple;
	bh=DkUCnYG16jGtLnxsToJ+wLj2mcAHqaEZVr8oBF4zY/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTCaEh2LJ9fM+OC0StO5lRIJeH6zOBEBzVabGWQCVgZ8yHDlrqOfj710ZLoYHfOq9CFW9xOldveh8i7dgOs63kjNZNWXYzjMa0fV1T3z85ZWTR3/BjvxIzg6DdXqdVIqXXFJI9Z4RAWhDGdNEIgJa2k+C3bQrUQodPZW9nllA2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ga0EKb6V; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68281F00893;
	Fri, 29 May 2026 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780046004;
	bh=FXj5u36sg2hgyUPKcHk2jErv4YWBbc9Vg9Nk/pqvO+s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ga0EKb6VAZx0lj+0Znh56/Rc5aMP9kT28wWqOzKGGpIrPVPvrJRkLfGM/okcsYtH6
	 hryj0NWTyzwls5i69zwUy/IoX4+sqkwSi4qkWJTaKE4ZTiCScezTmIOLx4ROizDmr5
	 gpXd1Zl6mPAYyqWLPLXsSRTpTj7qgnPfadedXwmM5UbB3al26ZL6+1tJ5vgnk1R2b2
	 QDNYItuC/qpHW1WiELwjv9bKP/6tjHpS8MJodT3pXLiBbfUNDo93XLlayDnyO42Eob
	 vnmLE1xAqJ7oLVo9lyC9j9ytILcQZ9I3MARW0/oQOBwqmtSYaIvNZ/8KZ/cvH7v/8b
	 AdJykaZ1zuYMA==
Message-ID: <28147335-f52d-4c74-8f1b-c3c3e5669566@kernel.org>
Date: Fri, 29 May 2026 10:13:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: iris: add support for purwa platform
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260529-enable_iris_on_purwa-v8-0-b1b9670459ab@oss.qualcomm.com>
 <FbrMbTbSATsfUzmR2WEfodqIdJU5mZKc-bD7y0vq6EeM7MioKBu2pGek6fl2pMfzSgRA4mr0bWXTFpm3vcbNzw==@protonmail.internalid>
 <77b29e18-5abf-4254-b027-ba443f4eccbf@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bod@kernel.org>
In-Reply-To: <77b29e18-5abf-4254-b027-ba443f4eccbf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63019-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B926A5FFC84
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 29/05/2026 09:46, Jie Gan wrote:
>> All patches have been tested with v4l2-compliance and v4l2-ctl on
>> purwa. And it does not affect existing targets.
>>
> Please rebase on the latest linux-next tag, saw conflict with the commit:
> 95a337f92f0a  media: iris: switch to hardware mode after firmware boot
> 
> Thanks,
> Jie

That's a -stable commit.

Base patches off of media-committers/next.

media-committers 
git@ssh.gitlab.freedesktop.org:linux-media/media-committers.git (fetch)
media-committers 
git@ssh.gitlab.freedesktop.org:linux-media/media-committers.git (push)

---
bod

