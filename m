Return-Path: <linux-media+bounces-40253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D6CB2C098
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 13:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5017816D5D4
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 11:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01AC32BF25;
	Tue, 19 Aug 2025 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6OYW1j2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AB530F813;
	Tue, 19 Aug 2025 11:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603121; cv=none; b=BT6iN3/c3GMv6TEoBZ6D5rVPWouTOVSRAUFdxm5C+hg704XYimjTlklJcPmJaoXKCOgNDKwp3Nt6mTsnxT0piGqatTGZoaZ3GVA0JSS8kkckV8FVkrsbeCwBqL6LylQc3dTlPiAlHRZa/faBC5jzfLCtoq4hHufm3085j9C4P7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603121; c=relaxed/simple;
	bh=xk21yYxTPrpJlQW1zpMfkatIUVFMuWMI1dlu7eQZ/Ds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=To0N9DMjgycrOLatLZ/NrRl48/kbRWF/cqM5NqqXTZW7aL/Ek/vtVSi8HhIULL77nuyGiQ+WYD6zwnHWyJMhqaEamm8PrcHptU4AQIY0d6UVrTNtna7ZUaNrU2h/wVkFPnDeqBy7xeAA2IVFDFHjtx5oXQ2Cx6NlcpsOd1E8vcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6OYW1j2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A1EC4CEF1;
	Tue, 19 Aug 2025 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755603120;
	bh=xk21yYxTPrpJlQW1zpMfkatIUVFMuWMI1dlu7eQZ/Ds=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=n6OYW1j2RqLKw6TyxArRNH26G93qpiwO6sRXgeCNldIveXwLltxRkGLtMabet3CkR
	 wQunkdQE7q5QiwMJCbpYdt8O6DObyoAjcwi+NUpVdD1LWVLiRvR3Xl04sBvA9cOdwe
	 zALJ2IKZK7SnG+TPAJ+dQ47ImZU51W9t4818hC0egbkeKD7mpoRahPNYYsyY3JMv6e
	 abDHF2GE5nEXgrC8hNA2fepVnxx3yAFN86vfXmymXazAq0XpeJ5sKLI/6aAUdQuEie
	 wcQZDTNNUFjyWbFVjQ0iBGgEZmTJhzc7j8DRl84kLsy1FvRZs7s4Icfd17Eq2CoDLv
	 ZsuAuvAhyxUSQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 thierry.escande@linaro.org, quic_vgattupa@quicinc.com, 
 Ling Xu <quic_lxu5@quicinc.com>
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
Subject: Re: [PATCH v3 0/4] Add missing fixes to FastRPC driver
Message-Id: <175560311807.1303568.7881475983315661805.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 12:31:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 07 Aug 2025 15:34:16 +0530, Ling Xu wrote:
> This patch series adds the listed bug fixes that have been missing
> in upstream fastRPC driver.
> - Store actual size of map and check it against the user passed size.
> - Consider map buf for map lookup.
> - Fix possible map leak in fastrpc_put_args.
> - Skip refcount increment for DMA handles.
> Patch [v2]: https://lore.kernel.org/linux-arm-msm/20250806115114.688814-1-quic_lxu5@quicinc.com/
> 
> [...]

Applied, thanks!

[1/4] misc: fastrpc: Save actual DMA size in fastrpc_map structure
      commit: 69fb36431c5e1bd09981f931b3030296cdc6c7b5
[2/4] misc: fastrpc: Fix fastrpc_map_lookup operation
      commit: a8b2a851e3f9a8497ff857d9a152659988612af4
[3/4] misc: fastrpc: fix possible map leak in fastrpc_put_args
      commit: ba7a9771f1e3a622d51f95a1f5a4ff9958ca5c64
[4/4] misc: fastrpc: Skip reference for DMA handles
      commit: cbf27dd4e98e5a3b71dbe89972461ce5bb4c188c

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


