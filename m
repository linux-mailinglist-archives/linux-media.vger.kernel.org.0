Return-Path: <linux-media+bounces-27403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E25E0A4C714
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DE493AC379
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5887922CBC1;
	Mon,  3 Mar 2025 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UuG+EEgQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A89142E6F
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741019026; cv=none; b=Y1jmfGBA+WAmmZjwdKEDQX5TwbKhD7273kzP++F/a782fpxqCfrARE7aw5sohCA3lEedLbxcoelCo1XC2g29zoipAhP06DMPj2602VZ7H6kyrNcybSOq75XMcD9ABbuhOPvZ0iH3hfjJhWIo5lzfeHzMBiRAV0x+8AH3vGWwzGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741019026; c=relaxed/simple;
	bh=6I+JXN8BZvRVeqmmqG6vp1AS1KTVHqwmE02eKEESqCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=KDLlnOsoliMKdqxGKg3450KK9y7jrIBIcTjM7e0Xe69RCcgkbVQ0LbJOXBmF3ysDLaUgPBSkcT/Nt8nkLWJZJ7WBymcEz5wT7e0tRx7Yml7Qdo8NuSgls4LkehAPb1kY9l+UgTHSLqmvJA3Fa1ppdvc1krGk4R6ofisFO0kwiKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UuG+EEgQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 038E3C4CED6;
	Mon,  3 Mar 2025 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741019026;
	bh=6I+JXN8BZvRVeqmmqG6vp1AS1KTVHqwmE02eKEESqCI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UuG+EEgQ+1jFwi0f91rAAFJioKR5TSK2ZgP7BM1oKhtUsKQJauN+31P3XR7J2ryqm
	 J+RJochAy+WU/+qIlgzq1w61d+mZ5nL4coZtdLpW8I4TvCE6an9n+Oz6hqEzh/7Vvl
	 bJpRC6CCgOdgeWhNMaEHo4OtiwcW49T1uV0gil+TxYgb8dORPtCoBSD2PZUYSjxUyO
	 L0kN53I2wlUAWdNXm/Ize2SoiVcnI1Y6esDwCcWR11Ejf4J7sMEo7TOwN9QpC+EYtX
	 UNAMrhIDgxXFsqAYaivHfekgcFEqD11RMLOu2W1PZ7105i9MdLcMGSMpOQi7g0k97s
	 fuv4cWvUKIeqg==
Date: Mon, 3 Mar 2025 10:23:44 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	hdegoede@redhat.com, hans@hansg.org,
	stanislaw.gruszka@linux.intel.com, jerry.w.hu@intel.com,
	tian.shu.qiu@intel.com, daxing.li@intel.com, hao.yao@intel.com,
	bingbu.cao@linux.intel.com
Subject: Re: [RFC PATCH 0/7] Intel IPU7 PCI and input system device drivers
Message-ID: <20250303162344.GA168964@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221075252.3347582-1-bingbu.cao@intel.com>

On Fri, Feb 21, 2025 at 03:52:45PM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> This patch series adds a driver for Intel IPU7 input system.
> IPU7 is the seventh generation of Imaging Processing Unit, it is a
> PCI device which can be found in some Intel Client Platforms such as
> Intel Lunar Lake and Panther Lake, etc.
> User can use IPU7 to capture images from MIPI camera sensors, support
> both MIPI CSI DPHY and CPHY.

Minor whitespace nit:

  $ git am m/20250221_bingbu_cao_intel_ipu7_pci_and_input_system_device_drivers.mbx
  Applying: media: Rename the IPU PCI device table header and add IPU7 PCI IDs
  Applying: media: ipu7: add Intel IPU7 PCI device driver
  Applying: media: ipu7: add IPU7 DMA APIs and MMU mapping
  Applying: media: ipu7: add firmware parse, syscom interface and boot sequence
  .git/rebase-apply/patch:871: new blank line at EOF.
  +
  warning: 1 line adds whitespace errors.
  Applying: media: ipu7: add IPU7 firmware ABI headers
  Applying: media: ipu7: add IPU7 input system device driver
  Applying: media: ipu7: add Makefile and Kconfig for IPU7

