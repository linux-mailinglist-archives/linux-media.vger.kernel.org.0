Return-Path: <linux-media+bounces-49119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7819BCCE1BE
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 02:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9066D30084CB
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 00:59:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A26217F29;
	Fri, 19 Dec 2025 00:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b="ok3Sxbra"
X-Original-To: linux-media@vger.kernel.org
Received: from mailbackend.panix.com (mailbackend.panix.com [166.84.1.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CA61F75A6
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 00:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.84.1.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766105947; cv=none; b=KTGogHjSLmEm233e2iLwA0gIqMLEQ0qxiXHjDQyEb+sC2FFn+aG3x6q3wSulXB0xGcnvdccVH45Oyo4wTOKB5CQ35MplINU1aI+2WXkR7IgkdvNU/Fb0sJRZsxRqHoex2HB1XFUQBlEeBNtmTJf5fx5bggL3t6lIn9X3kwbU2bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766105947; c=relaxed/simple;
	bh=dKe9+hLXC2Stoqw2Mm0AA+iDQeraSwaCXh63TdqAA9Y=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=lf0H5R5KbJhZIJYvNyii+7BQT6ci9QLNihYgQd+iU5zqOcxNC8Vp1cGi74EAeonb9bvaQJQiy6FoD2UfabBZfgYs2AEHQHrqYGBOWxJS9wX8k5OLSDdrCQ4QZOcJeBMcJhj1x35mNbedJM5Dv4pI+sTQUpDgnWTuctDNL9lS8i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com; spf=pass smtp.mailfrom=panix.com; dkim=pass (1024-bit key) header.d=panix.com header.i=@panix.com header.b=ok3Sxbra; arc=none smtp.client-ip=166.84.1.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=panix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=panix.com
Received: from [10.50.4.39] (45-31-46-51.lightspeed.sndgca.sbcglobal.net [45.31.46.51])
	by mailbackend.panix.com (Postfix) with ESMTPSA id 4dXTgq5sTtz4f0Y;
	Thu, 18 Dec 2025 19:59:03 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=panix.com; s=panix;
	t=1766105944; bh=dKe9+hLXC2Stoqw2Mm0AA+iDQeraSwaCXh63TdqAA9Y=;
	h=Date:To:Cc:From:Subject;
	b=ok3Sxbrajc3DnD+DqaqGBZD0Jw7NLGn+gvIS7885Jv/j6HNonTjeDP/I9W7QHqK4U
	 JkiRmuAPzbCUvq7hRlw3qK+zlgB5pLOkpo2K53Jh+FG7FXl0iPf66YLQ9YlLt+XjtW
	 hHbTVXPeNvu7T/4697C1e0+ewC8B2lt3LgKqcCO8=
Message-ID: <126fda5e-0e23-4781-8008-8501d62c71cb@panix.com>
Date: Thu, 18 Dec 2025 16:59:02 -0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: akari.ailus@linux.intel.com
Cc: linux-media@vger.kernel.org, johannes.goede@oss.qualcomm.com,
 Kenneth C <kenny@panix.com>
From: Kenneth Crudup <kenny@panix.com>
Subject: IPU6 subsystem broken in 6.19-rc1 due to d7cdbbc93c5 ("software node:
 allow referencing firmware nodes")
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


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


