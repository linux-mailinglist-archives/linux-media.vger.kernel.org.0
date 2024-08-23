Return-Path: <linux-media+bounces-16623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0996D95C1B8
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 02:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC9031F2435D
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2024 00:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256E5187543;
	Fri, 23 Aug 2024 00:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qfGlG6gV"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793D4187343;
	Fri, 23 Aug 2024 00:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724371204; cv=none; b=Cdt6nAy6kSDqGe61jSg3lDDcp0VUMyW7ykCSWrv5jqQkq7eZgZK2fGlSCWau164I4TV489pLfW7n6ibJUONd3gE0XnFV0hvZcQ0i4QbRHmZ7ytRS+0NXJhsHUQj76LXMIPv0fwzK37JOR/YtoCngbhnkEF7mitub9FrcRBOQ77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724371204; c=relaxed/simple;
	bh=2RVmVcz8x2SCAECDsf4nXOUlxamrjBaYr40dCgB2n1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eN1vbvYZ/jKsULjkhC1nNTjvhZ00S0UbhPd2897jgbIoz0cWJ0OI+GMcXyHKTiaDstzBcvNnFIQPqaRSonTzM7WjbHo0lEDvgX4A4Z/DLjfmd9mvgr2EkZrhhihErP6xyU/OQywZWFfHG6wZD2ysmYeqSmPtQk2KckKYAkR96jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qfGlG6gV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56550C32782;
	Fri, 23 Aug 2024 00:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724371204;
	bh=2RVmVcz8x2SCAECDsf4nXOUlxamrjBaYr40dCgB2n1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qfGlG6gV/CbQNZBx1ISPTbmh/pI9l2MbmcypM2PYXTODU8eqjNmVX8h875nJD3tlc
	 SglJ2ABu8ecBo9uvFZE9MQ2OE2Cj4TdkHZ1RFCyimEIzjfvhbBjIxMUmiEYjBLUlW1
	 A6Zs3CEirj3oQUq1x6F8B3GPai5k6a5ZHwFQRFbTR5K/dccq8ie03Rp5AtaLeBVZZw
	 IhVdRIowdNboPB/WAxcu4vAqZTtbirofICM/ZLaNYujaZCtYC4thkxBp10amCbdLuc
	 cYW8uYI0Bhrh6uxVx3XUiwQ383EM4Xx91s9vpp4O+m9JeOjqftJSlzPU3Qc5rMZFp8
	 nLGT8ZmGUJB3A==
From: Kees Cook <kees@kernel.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Kees Cook <kees@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/2] media: venus: hfi_cmds: struct hfi_session_release_buffer_pkt
Date: Thu, 22 Aug 2024 17:00:00 -0700
Message-Id: <172437119700.4121665.12494254148788387510.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710230728.work.977-kees@kernel.org>
References: <20240710230728.work.977-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 10 Jul 2024 16:09:11 -0700, Kees Cook wrote:
> This replaces the 1-element "fake" flexible array in struct
> hfi_session_release_buffer_pkt with a modern flexible array and adds
> the __counted_by annotation that was identified during the analysis.
> 
> Thanks!
> 
> -Kees
> 
> [...]

Applied to for-next/hardening, thanks!

[1/2] media: venus: hfi_cmds: struct hfi_session_release_buffer_pkt: Replace 1-element array with flexible array
      https://git.kernel.org/kees/c/c93452777f53
[2/2] media: venus: hfi_cmds: struct hfi_session_release_buffer_pkt: Add __counted_by annotation
      https://git.kernel.org/kees/c/32ef4b710cbe

Take care,

-- 
Kees Cook


