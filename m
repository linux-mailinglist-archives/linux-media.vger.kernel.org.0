Return-Path: <linux-media+bounces-42342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1CDB53477
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 15:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17E875633B0
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 13:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99A133CE83;
	Thu, 11 Sep 2025 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AJeADdTl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CFF33EAE7;
	Thu, 11 Sep 2025 13:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757598633; cv=none; b=pwjRo5x4HBW+YPgiCfgaQymAql8cpHa5ZUEywogFyASwiS4bSCFZI7A+N7S1tYMvP50PYQh+skSzsBFr8f02pczgZgBvOcIhF/GpBJwglFz43eJeRI1qSKkepryNsXX6fpewk0s5MQ/bSNVmVJEpblUl0rLQeKV+xzCcFQ5NGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757598633; c=relaxed/simple;
	bh=m4shjtrhQt8FRRF1lcL5ELoPHuhcDARb6PwIqI52w5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzUlTdiF8Mlc7CdhHMHu9Y/x6+Idydx+KeX+Pyr6JfHV/UVPXKXFvml3DMySX5X7JFWPUCO5Al8kqJQlHNvMb42qnc2llb/lm7wdn5Ih5wj+bOfj1xEZmBjp2GiygRbMxGY/U0h9eC4k468MIbZsTEJmAfRgV6mIcvLBMQb0EU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AJeADdTl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8595FC4CEF0;
	Thu, 11 Sep 2025 13:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757598632;
	bh=m4shjtrhQt8FRRF1lcL5ELoPHuhcDARb6PwIqI52w5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJeADdTlgrbUqetu5+RC4UEqVNw6aKMUcMP5Ta1p+BjUTCN2/yIzLk9p/ROs/PJuN
	 LRNx4jeh+LJMhXfYPmNdRNsnjTkXpnoy5+OAE7qy1RleZ2KJUu8s0+EU0B2RpEbKXu
	 pnY9+zi3smt6nBFb6XEpCr4j+cig6Z6Q/m43Sv/w=
Date: Thu, 11 Sep 2025 09:50:31 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
	konradybcio@kernel.org, hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org, 
	catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_svankada@quicinc.com, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: Re: [PATCH v3.1] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
Message-ID: <20250911-crystal-dexterous-ostrich-fcdf3c@lemur>
References: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
 <20250910104915.1444669-1-quic_vikramsa@quicinc.com>
 <5a087d08-273e-4740-b47d-fc25be952ebd@kernel.org>
 <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2a7bd0cd-a6c4-47c3-a6ca-f9d94c9b65ec@oss.qualcomm.com>

On Wed, Sep 10, 2025 at 02:25:30PM +0200, Konrad Dybcio wrote:
> > Please version your patches correctly, e.g. use b4 or git format-patch
> > -vX, and add changelog in cover letter or under '---' of individual
> > patches describing changes from previous version.
> > 
> > What is v3.1? How to compare it? Try yourself:
> 
> This is a weird invention that some media maintainers seem to promote..

Please tell them to stop. Patch revisions are not supposed to follow any kind
of semver. It's a new version of a patch and it should always be a simple full
integer increment.

> As a b4 user, I would also like it to stop, as doing anything other than
> v(integer) will open the door for unlimited craziness

To my knowledge, no tooling will do the right thing with that -- b4,
patchwork, patchew, etc. It's needlessly complicating things.

-K

