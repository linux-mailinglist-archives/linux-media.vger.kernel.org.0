Return-Path: <linux-media+bounces-33109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53488AC0ADC
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 13:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C715DA2441D
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 11:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9733028A41F;
	Thu, 22 May 2025 11:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+fxRIzU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E9D28A413;
	Thu, 22 May 2025 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914818; cv=none; b=pX+d7jvheCYja4wRgKLMeahwcnTpBR1CV4LUxSOvaf3bCLiM6FtwDrhMHKVni+7BU0IHKdYaoIsZ38v5Xv/qCxetqfWbe7Z6VcRylgwQyDb58GuCTwqiWPD/tDPCqlIMSwqNO7mJW7F4spysIik3Hiq2LyvWeiJ5vtzgd0jLMl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914818; c=relaxed/simple;
	bh=ijy9JScg8N1C3zekgNmc1lKwg1LhXgjoX6IU9odZsxY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XugRtVLtsoKjqkPRrbm1+CCugP+hoBjmUd4+RtGQXeS+6vRaPOIxmDW4FPFV0ahuEW/ad7I6neBioISrdqhj3FKGc2FFD61evzqQ6X9bJFyJJ+9xlClELrOoPagvJ0pNWyPZM9zOv1S9G5W5RvRxOtL+O/PCsX7Xv61oZ0BFsG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+fxRIzU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-551f00720cfso6043372e87.0;
        Thu, 22 May 2025 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747914813; x=1748519613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwMF4Gfg4Vle5CpbfWncakzXgFVxIYbBHZBQLHfwCBI=;
        b=Q+fxRIzUDj2Ds2ghKZzmu8gz3IX9HCLQMOcWhPmHyWdmDJaPfdMKtNtKZ4CL0/oNa/
         iS1uN90/G2z1VTviWudcjqk4iXxVBMOkiy0bEmHoA0sFNXvPC46zszeKFuahJbsqMpeo
         KI8lvrAcxhQjHXQM6J45h9iUlFD7I3tIJi+iQKLA4jONUg5gPvoTyYxEC4oM1khWyRAB
         zUKURFPHwO2S7MrPjx7T3lj1OKYKXxGTzXG9T6VT+GjtKuqM61Bu1b7pnlDkS0HPtxZt
         jk97PbTlzcxqf/FzXGY22sq1gpH/6P1Z7Q8Hd0fPOIcqv05mgQo+YXOZvpkTs9bMcTPy
         bIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914813; x=1748519613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwMF4Gfg4Vle5CpbfWncakzXgFVxIYbBHZBQLHfwCBI=;
        b=aqIVl8DBYKjq3y1s+Ht/EBCZfeYc+Jgn389hw8EbKguld8k/0OxMTO1xTr+jyjCWxT
         KVWP+jdIJiWkxzzQNXRl2JisAUGSFZPX9pe34yRLUl/z+mFzE5Iwu+6E4dmZ3/2SOB+D
         bJeCIMiWgY0W0sR0vJ6QuK6oukdEBvMqu4wmdjViZXLlZHWYOs08ImwBye84L41d3H/l
         EM9OrUt7Lv3Rz906YkIypFXAE+MSeoDtAe3HFpVKYu7RwIzVU1/GFmwNE5ib/otrT8A2
         IQSx9Gsqeww5gutPkxY6nLqLJELbfTq/l00h++d3Kv5/gLABO3wpjX+5crMtIJtOBOAd
         qnJg==
X-Forwarded-Encrypted: i=1; AJvYcCWzVTWqgZjvTuX4jv2FQqtFdmuoDkuzJ+UER/yKUVQJH9jf1Chd4WJTLc2TGiHRpeh0jbcxQ3uxP2yUFhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYe+D2l/P7xL3iR3GogUqPDOQOm33Rh1MGF7BWJuhjT+wGRjVH
	EKlKvfqLZlwnpFUPa2J8AcCuyNMdcrN62koJP5Z1YD6lS7cE1RI1obd0
X-Gm-Gg: ASbGncsSEW64RsF/aUZM+7mlLBEJgHMOuv76SSozKgmpymRKqJiYc917WmsrsZ2YDWG
	ZkybCcR3hkq2hyducbYD/6o2qufrEP9tlPms69Qs4ofvSV/HZ8M245JLRSoCfmwZxwsEOC7iOe6
	uJqUFD3KtIBSirSgOMY8pOqeYVTJok8j3IFiGPRNWcazfNzN0NMD7/RFVErpWnGOu0OSVg8wgrW
	wAFL0Id5xwz2rDPS/S4RHel+JnloYopvrB7v3avwEdb1amRP2i89a/c4U4rlfXrm1XkyWc0Rq3V
	wUoTc3+i4gmiBfHlSE2KjFfWH9ukoe6/gAkTc/KHACv/YVt1rs8OoZinqwnwE76mZ4KZWcCoL4F
	f+yW0ul9Yquruqh9PTgShAXmGxKI3yK3g+bMriOFbwMkgng==
X-Google-Smtp-Source: AGHT+IHGfGAbdjCjz0z4GkbijHMsN49HXcO1yeU1zsxmyp3p3oqHwPlIjWdOMgxU5lbxtz/VoIOTfw==
X-Received: by 2002:a05:6512:3e04:b0:550:de26:1f23 with SMTP id 2adb3069b0e04-550e71bb785mr9605192e87.16.1747914812546;
        Thu, 22 May 2025 04:53:32 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-53-1500-7c4-bcaf-182a-540c.rev.dnainternet.fi. [2001:14ba:53:1500:7c4:bcaf:182a:540c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017e79sm3343760e87.154.2025.05.22.04.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:53:32 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: mchehab@kernel.org,
	ribalda@chromium.org,
	hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com,
	hljunggr@cisco.com,
	dave.jiang@intel.com,
	jgg@ziepe.ca,
	saeedm@nvidia.com,
	Jonathan.Cameron@huawei.com,
	corbet@lwn.net,
	ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	W_Armin@gmx.de,
	mpearson-lenovo@squebb.ca,
	skhan@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH v2 3/4] docs: Improve grammar in Userspace API/fwctl
Date: Thu, 22 May 2025 14:52:54 +0300
Message-Id: <20250522115255.137450-3-hannelotta@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250522115255.137450-1-hannelotta@gmail.com>
References: <20250522115255.137450-1-hannelotta@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix typos and improve grammar in the documentation for
fwctl subsystem.

Use the word user space consistently, instead of having
two variants (user space vs. userspace).

Change wording of denied behaviour to be disallowed
behaviour when describing the interface.

Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---

Notes:
    v1 -> v2: No changes

 Documentation/userspace-api/fwctl/fwctl.rst | 30 ++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/userspace-api/fwctl/fwctl.rst b/Documentation/userspace-api/fwctl/fwctl.rst
index fdcfe418a83f..a74eab8d14c6 100644
--- a/Documentation/userspace-api/fwctl/fwctl.rst
+++ b/Documentation/userspace-api/fwctl/fwctl.rst
@@ -54,7 +54,7 @@ operated by the block layer but also comes with a set of RPCs to administer the
 construction of drives within the HW RAID.
 
 In the past when devices were more single function, individual subsystems would
-grow different approaches to solving some of these common problems. For instance
+grow different approaches to solving some of these common problems. For instance,
 monitoring device health, manipulating its FLASH, debugging the FW,
 provisioning, all have various unique interfaces across the kernel.
 
@@ -87,7 +87,7 @@ device today may broadly have several function-level scopes:
  3. Multiple VM functions tightly scoped within the VM
 
 The device may create a logical parent/child relationship between these scopes.
-For instance a child VM's FW may be within the scope of the hypervisor FW. It is
+For instance, a child VM's FW may be within the scope of the hypervisor FW. It is
 quite common in the VFIO world that the hypervisor environment has a complex
 provisioning/profiling/configuration responsibility for the function VFIO
 assigns to the VM.
@@ -105,19 +105,19 @@ some general scopes of action (see enum fwctl_rpc_scope):
 
  3. Write access to function & child debug information strictly compatible with
     the principles of kernel lockdown and kernel integrity protection. Triggers
-    a kernel Taint.
+    a kernel taint.
 
- 4. Full debug device access. Triggers a kernel Taint, requires CAP_SYS_RAWIO.
+ 4. Full debug device access. Triggers a kernel taint, requires CAP_SYS_RAWIO.
 
 User space will provide a scope label on each RPC and the kernel must enforce the
 above CAPs and taints based on that scope. A combination of kernel and FW can
 enforce that RPCs are placed in the correct scope by user space.
 
-Denied behavior
----------------
+Disallowed behavior
+-------------------
 
 There are many things this interface must not allow user space to do (without a
-Taint or CAP), broadly derived from the principles of kernel lockdown. Some
+taint or CAP), broadly derived from the principles of kernel lockdown. Some
 examples:
 
  1. DMA to/from arbitrary memory, hang the system, compromise FW integrity with
@@ -138,8 +138,8 @@ examples:
 fwctl is not a replacement for device direct access subsystems like uacce or
 VFIO.
 
-Operations exposed through fwctl's non-taining interfaces should be fully
-sharable with other users of the device. For instance exposing a RPC through
+Operations exposed through fwctl's non-tainting interfaces should be fully
+sharable with other users of the device. For instance, exposing a RPC through
 fwctl should never prevent a kernel subsystem from also concurrently using that
 same RPC or hardware unit down the road. In such cases fwctl will be less
 important than proper kernel subsystems that eventually emerge. Mistakes in this
@@ -225,12 +225,12 @@ subsystems.
 
 Each device type must be mindful of Linux's philosophy for stable ABI. The FW
 RPC interface does not have to meet a strictly stable ABI, but it does need to
-meet an expectation that userspace tools that are deployed and in significant
+meet an expectation that user space tools that are deployed and in significant
 use don't needlessly break. FW upgrade and kernel upgrade should keep widely
 deployed tooling working.
 
 Development and debugging focused RPCs under more permissive scopes can have
-less stabilitiy if the tools using them are only run under exceptional
+less stability if the tools using them are only run under exceptional
 circumstances and not for every day use of the device. Debugging tools may even
 require exact version matching as they may require something similar to DWARF
 debug information from the FW binary.
@@ -261,7 +261,7 @@ Some examples:
  - HW RAID controllers. This includes RPCs to do things like compose drives into
    a RAID volume, configure RAID parameters, monitor the HW and more.
 
- - Baseboard managers. RPCs for configuring settings in the device and more
+ - Baseboard managers. RPCs for configuring settings in the device and more.
 
  - NVMe vendor command capsules. nvme-cli provides access to some monitoring
    functions that different products have defined, but more exist.
@@ -269,15 +269,15 @@ Some examples:
  - CXL also has a NVMe-like vendor command system.
 
  - DRM allows user space drivers to send commands to the device via kernel
-   mediation
+   mediation.
 
  - RDMA allows user space drivers to directly push commands to the device
-   without kernel involvement
+   without kernel involvement.
 
  - Various “raw” APIs, raw HID (SDL2), raw USB, NVMe Generic Interface, etc.
 
 The first 4 are examples of areas that fwctl intends to cover. The latter three
-are examples of denied behavior as they fully overlap with the primary purpose
+are examples of disallowed behavior as they fully overlap with the primary purpose
 of a kernel subsystem.
 
 Some key lessons learned from these past efforts are the importance of having a
-- 
2.39.5


