Return-Path: <linux-media+bounces-47162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96104C603DF
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 12:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 872E335BD66
	for <lists+linux-media@lfdr.de>; Sat, 15 Nov 2025 11:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795E329A300;
	Sat, 15 Nov 2025 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzMjwTPE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16CC2222C4;
	Sat, 15 Nov 2025 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763205950; cv=none; b=GbMjT0V2Ej0NabHa5n9s3oKuwmVKge09fkHTYONdbHOPzOsZx2ELG1J7VN85pDn3Ul17Bsv3LqGuMsJ5Q8KkqEF86f/JV2YQZ/KnphmtE33/wMfxsJpKEQLOyJbCj1IbW6k2O45qWlgrNFeFfA4SF4YUFvPm6++gD3lfYaLSWQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763205950; c=relaxed/simple;
	bh=ihnAcrwzmNvgHB9t80E3vh83Va4si89oujP9YCym2h8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DRQZpnAmpsnqnxs1giSkcX1z89h5RtArMryQsWWtomZCVfDv4kRP++QfDCKvAb+eZhzx+nfwev54kA9LI7hqdq8Hu8lMq5fzs0cy24ifFM+ocJ+K6y23+4O6w4q+FkzHky+8rZ6hjxmfFs+dyUB+fDDXmQSqBR2l/UmS3EUjeqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzMjwTPE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5829C4CEF5;
	Sat, 15 Nov 2025 11:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763205950;
	bh=ihnAcrwzmNvgHB9t80E3vh83Va4si89oujP9YCym2h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jzMjwTPEpRbot8bpnCZe84zsYrveejOWKshH765b5fhn7ws+wT9keiBLsBaVWmU68
	 MnnjHSoWXtGYtUX9KdV9t+Fmr035XnYuDBNiP1M4X5p+W+JYj/XEGqiMoqDsfHdrrB
	 fdPRlO8JPG4UkS87xxC4gvOJGACEk61MhWtdgREDsOgbOZRrpeKnx6MSRxGBMp0Xwa
	 vnhq+AXrZq4pjNHp0rcy6I9KUhVYeG06y56HLEoCurT4K4MfP7WoXinQK9WzyXSyt6
	 llQptJNNH+LGubtBPmgUXMmbaWS09hbu6Ly5FyYHEl6DAbqqYrprbIEcqz+IC4rIOW
	 +3V8nLhkMXnoA==
Date: Sat, 15 Nov 2025 12:25:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
Message-ID: <20251115-masterful-foamy-malkoha-ffc0e4@kuoka>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>

On Thu, Nov 13, 2025 at 07:29:18PM -0800, Hangxiang Ma wrote:
> Add the compatible string "qcom,kaanapali-camss" to support the Camera
> Subsystem (CAMSS) on the Qualcomm Kaanapali platform.
> 
> The Kaanapali platform provides:
> - 3 x VFE, 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
> - 3 x CSID
> - 2 x CSID Lite
> - 6 x CSIPHY
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  .../bindings/media/qcom,kaanapali-camss.yaml       | 639 +++++++++++++++++++++
>  1 file changed, 639 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


