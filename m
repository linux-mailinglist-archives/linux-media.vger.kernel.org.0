Return-Path: <linux-media+bounces-49120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B601BCCE1D6
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4570A303262D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 01:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424F9221F2F;
	Fri, 19 Dec 2025 01:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="AfQxsiqq"
X-Original-To: linux-media@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8611DDC2B
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 01:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766106268; cv=none; b=LYXiRCHcPpEq67nUwj0cEvc9XYPrNo/dc6Qtpz6C7rnU1ElBt/ZQS2cm/xmzS+PaJ3mr9LoMtaX0XPk4C6B88P9gd55/IEuQGsOibQQfaJKXGh+Kyk5xxEZQHBKL6sArtAom0NNx4rfihLWeqkLpNmOEXlfsePfvAvO7Lt+YNn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766106268; c=relaxed/simple;
	bh=O+B5C2Y2ju/JwB6YDSxp5remQo87L3/ueOWfev6rHWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbkqqt/PvV7niQxj6K3kvIwh0itTXXs4s8OrCcsLhc+6Bsc5nInWw2uv9n/1axZuAa8wsWc37Kes0920hncSOO2ZbFucUrN8HG7aNF9i/a/rrkEQjc48Ex/vwgRh+kdTE4vLLZnJVrF2/TEvDW7eeu7BPT+PD7iO+bCZarsu7lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=AfQxsiqq; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.39] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4dXTp12CYtz4fTZ;
	Thu, 18 Dec 2025 20:04:25 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1766106265; bh=O+B5C2Y2ju/JwB6YDSxp5remQo87L3/ueOWfev6rHWo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=AfQxsiqq9aANg+8CElH7uLWamXUZlOn3niizVmHAXYxUqkdBvLSUzLjgmSuaPH1Ee
	 Nq4U9WcuOCN4g1c5gBnqeSEy3ObwaI/GRJd19C42vXIR0wyN6Vp3O9bH4nMYtDp7K/
	 iiys4af5so7Ptdpi17Vz0gdStDCYLlpOu1keV9z8=
Message-ID: <af773b82-bef2-4209-baaf-526d4661b7fc@panix.com>
Date: Thu, 18 Dec 2025 17:04:24 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IPU6 subsystem broken in 6.19-rc1 due to d7cdbbc93c5 ("software
 node: allow referencing firmware nodes")
To: sakari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, johannes.goede@oss.qualcomm.com
References: <126fda5e-0e23-4781-8008-8501d62c71cb@panix.com>
Content-Language: en-US
From: Kenneth Crudup <kenny@panix.com>
In-Reply-To: <126fda5e-0e23-4781-8008-8501d62c71cb@panix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


(Fixed Sakari's E-mail address and resending new to avoid reply-quote 
formatting issues)

(Also posted here: https://github.com/intel/ipu6-drivers/issues/405 )

I run Linus' master (currently as of ea1013c153927) as my daily driver 
(mostly to find bugs like this). When the merges for the 6.19 series 
started to trickle in, I'd noticed my camera stopped working:

```
[Mon Dec 15 21:49:29 2025] [    T151] intel-ipu6 0000:00:05.0: Found 
supported sensor OVTI01A0:00
[Mon Dec 15 21:49:29 2025] [    T151] intel-ipu6 0000:00:05.0: Connected 
1 cameras
[Mon Dec 15 21:49:29 2025] [    T151] intel-ipu6 0000:00:05.0: 
IPU6-v3[465d] hardware version 5
[Mon Dec 15 21:49:29 2025] [   T1553] ivsc_csi 
intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: can't obtain sink endpoint
[Mon Dec 15 21:49:29 2025] [   T1553] ivsc_csi 
intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: probe with driver 
ivsc_csi failed with error -22
```
After bisecting, I'd tracked down the failure to the commit in the 
title, and at this patchset:

```
@@ -633,7 +650,10 @@ software_node_graph_get_remote_endpoint(const 
struct fwnode_handle *fwnode)

         ref = prop->pointer;

-       return software_node_get(software_node_fwnode(ref[0].node)); 
<---- old line works
+       if (!ref->swnode)
+               return NULL;          <--- no "swnode" after this 
commit, so it fails here
+
+       return software_node_get(software_node_fwnode(ref->swnode));
```
... and here's the code in .../drivers/media/pci/intel/ivsc/mei_csi.c 
where it fails:

static int mei_csi_parse_firmware(struct mei_csi *csi)
{
         struct v4l2_fwnode_endpoint v4l2_ep = {
                 .bus_type = V4L2_MBUS_CSI2_DPHY,
         };
         struct device *dev = &csi->cldev->dev;
         struct v4l2_async_connection *asd;
         struct fwnode_handle *sink_ep, *source_ep;
         int ret;

         sink_ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 
0, 0);
         if (!sink_ep) {
                 dev_err(dev, "can't obtain sink endpoint\n");
                 return -EINVAL;
         }


I looked at the  fwnode/software node code, and the definition and use 
of that UUID in the ivsc_csi/intel_vsc code and attempted to try a fix, 
but I'm not at all familiar with the ` _node` API and figured I should 
just file an issue rather than go down the rabbit hole I have  little 
time for (at least RN).

It looks like I'll need to add a "swnode" (as the "fwnode" is gone?) but 
not sure how to do that (my first attempts failed).

If you need any further information, LMK.

-K

-- 
Kenneth R. Crudup / Sr. SW Engineer, Scott County Consulting, Orange 
County CA


