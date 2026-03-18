Return-Path: <linux-media+bounces-56251-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAjYIVg8u2lehQIAu9opvQ
	(envelope-from <linux-media+bounces-56251-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:59:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 242A12C3F46
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 00:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D8693098749
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2026 23:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834FF3939AE;
	Wed, 18 Mar 2026 23:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NvW0gMfh"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B344594A;
	Wed, 18 Mar 2026 23:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773878353; cv=none; b=shJXeLppr4n2JzBjCNymgYBbYYLxS5ZyvacPnKeoSm889k/9bBrq+yqgdY0lZKS+im4UqrnWRA48fqAg8ZVEgG3zwKFXC4qFu74CCrFy0tUHba8cLYM3PMw+FCenCKsMGKfnKZAVEiYmsamL6S/ZfV0L+w9AhU83sDGPBgwV63I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773878353; c=relaxed/simple;
	bh=XoaVTMoY7sfL/xFUXVexGdlbZBaHFnQyeNZ7QCLHcjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HribGW4n0jFmXH26yV2APjY+Ff0pCYCdlLc5krHGixqTDx3hn1i7UyrKa5Y9zuhieNMw/ePv5p/tLLTQfTjxPYcGidSzNIGeUAH8sg5o/jDjS6wP3iq8JtI3+tLA7Dnf+HeQdFUlFjUaqAXzsvhwoh5Z62qD05ZRMbOAsdYUgAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NvW0gMfh; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BAE57379;
	Thu, 19 Mar 2026 00:57:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773878275;
	bh=XoaVTMoY7sfL/xFUXVexGdlbZBaHFnQyeNZ7QCLHcjU=;
	h=From:To:Cc:Subject:Date:From;
	b=NvW0gMfhcBm8dd22/SeqCYdbn4Eq88nT5rflOBZN23zUXEbQ+VLbTw8vYOJGSxvbg
	 Gsp0fHGCRe0Qjmgb53YSlgkw7/1zozhZFzN3zeunL/wZTp9RzGKrAwKo4w30mh8hab
	 at68KC7SzbTZzLIg3yujD5jGJOvf74YhrzFRYE/k=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH v4 00/13] media: renesas: vsp1: Fix v4l2-compliance failures
Date: Thu, 19 Mar 2026 01:58:54 +0200
Message-ID: <20260318235907.831556-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56251-lists,linux-media=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 242A12C3F46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

This series fixes most of the v4l2-compliance failures in the VSP1
driver. The v4l2-compliance log is very long, so I've only included the
executive summary, if anyone wants the full log, please let me know.

----------------------------------------
root@buildroot ~ # v4l2-compliance -m /dev/media2
v4l2-compliance 1.33.0-5460, 64 bits, 64-bit time_t
v4l2-compliance SHA: 91a4a7a9a5b3 2026-03-18 21:55:59
                                              
Compliance test for vsp1 device /dev/media2:
                                    
Media Driver Info:
        Driver name      : vsp1
        Model            : VSP2-I                 
        Serial           :
        Bus info         : platform:fe9a0000.vsp
        Media version    : 7.0.0                                 
        Hardware revision: 0x01011404 (16847876)     
        Driver version   : 7.0.0

[...]

Compliance test for vsp1 device /dev/v4l-subdev14:
                                           
Driver Info:                                         
        Driver version   : 7.0.0                                          
        Capabilities     : 0x00000000                                                                        
        Client Capabilities: 0x0000000000000002                                                                         
interval-uses-which Media Driver Info:                                                                                  
        Driver name      : vsp1                                                                              
        Model            : VSP2-I                                                                                
        Serial           :                                                                            
        Bus info         : platform:fe9a0000.vsp                                                             
        Media version    : 7.0.0                                                                                        
        Hardware revision: 0x01011404 (16847876)                                                                          
        Driver version   : 7.0.0                                                                             
Interface Info:                                                                                                  
        ID               : 0x030000ab                                                                 
        Type             : V4L Sub-Device                                                               
Entity Info:                                                               
        ID               : 0x00000014 (20)                                                                                
        Name             : fe9a0000.vsp hgo           
        Function         : Video Statistics                         
        Pad 0x01000015   : 0: Sink                                            
          Link 0x0200003b: from remote pad 0x1000013 of entity 'fe9a0000.vsp clu' (Video Look-Up Table): Data
          Link 0x0200003d: from remote pad 0x100001c of entity 'fe9a0000.vsp hsi' (Video Pixel Encoding Converter): Data
          Link 0x0200003f: from remote pad 0x100001f of entity 'fe9a0000.vsp hst' (Video Pixel Encoding Converter): Data
          Link 0x02000041: from remote pad 0x1000022 of entity 'fe9a0000.vsp lut' (Video Look-Up Table): Data
          Link 0x02000043: from remote pad 0x1000025 of entity 'fe9a0000.vsp rpf.0' (Video Pixel Formatter): Data
          Link 0x02000045: from remote pad 0x1000028 of entity 'fe9a0000.vsp sru' (Video Scaler): Data
          Link 0x02000047: from remote pad 0x100002b of entity 'fe9a0000.vsp uds.0' (Video Scaler): Data
        Pad 0x01000016   : 1: Source                                                 
          Link 0x020000a1: to remote pad 0x1000002 of entity 'fe9a0000.vsp hgo histo' (V4L2 I/O): Data, Enabled, Immutable

[...]

Sub-Device ioctls (Source Pad 1):                                       
        Try Stream 0                                                    
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK   
                fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536
                fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)                        
        test Try VIDIOC_SUBDEV_G/S_FMT: FAIL                                                                            
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)                                                   
        Active Stream 0                                                                                      
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK                                   
                fail: v4l2-test-subdevs.cpp(369): fmt.width == 0 || fmt.width > 65536                 
                fail: v4l2-test-subdevs.cpp(418): checkMBusFrameFmt(node, fmt.format)                        
        test Active VIDIOC_SUBDEV_G/S_FMT: FAIL                                                                         
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)                                                  
        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported) 

[...]

Grand Total for vsp1 device /dev/media2: 812, Succeeded: 808, Failed: 4, Warnings: 0
----------------------------------------

The remaining failures are, I believe, bugs in v4l2-compliance. They are
caused by the histogram source pad, which uses the
MEDIA_BUS_FMT_METADATA_FIXED format, hardcoding the width and height to
0. I believe this is a correct behaviour, as documented in [1]. I will
try to send fixes for v4l2-compliance.

The series has also been tested with the vsp-tests suite, which reported
no regression.

Compared to v3, this version addresses issues in the HSI, HST, HGO and
HGT modules that did not appear with the VSP-BD but get reported with
the VSP-I.

[1] https://docs.kernel.org/userspace-api/media/v4l/subdev-formats.html#metadata-formats

Laurent Pinchart (13):
  media: renesas: vsp1: Store supported media bus codes in vsp1_entity
  media: renesas: vsp1: Store size limits in vsp1_entity
  media: renesas: vsp1: Fix code checks in frame size enumeration
  media: renesas: vsp1: rpf: Fix crop left and top clamping
  media: renesas: vsp1: rpf: Fix crop width and height clamping
  media: renesas: vsp1: rwpf: Fix media bus code and frame size
    enumeration
  media: renesas: vsp1: brx: Fix format propagation
  media: renesas: vsp1: hsit: Fix size enumeration
  media: renesas: vsp1: histo: Fix code enumeration
  media: renesas: vsp1: histo: Fix size enumeration
  media: renesas: vsp1: histo: Fix format setting
  media: renesas: vsp1: Implement control events
  media: renesas: vsp1: Initialize format on all pads

 .../media/platform/renesas/vsp1/vsp1_brx.c    |  37 ++---
 .../media/platform/renesas/vsp1/vsp1_clu.c    |  47 ++-----
 .../media/platform/renesas/vsp1/vsp1_entity.c | 112 +++++++--------
 .../media/platform/renesas/vsp1/vsp1_entity.h |  21 +--
 .../media/platform/renesas/vsp1/vsp1_histo.c  |  97 +++++++++----
 .../media/platform/renesas/vsp1/vsp1_histo.h  |   2 -
 .../media/platform/renesas/vsp1/vsp1_hsit.c   |  61 ++++++++-
 .../media/platform/renesas/vsp1/vsp1_iif.c    |  39 ++----
 .../media/platform/renesas/vsp1/vsp1_lif.c    |  40 ++----
 .../media/platform/renesas/vsp1/vsp1_lut.c    |  47 ++-----
 .../media/platform/renesas/vsp1/vsp1_rpf.c    |   7 +-
 .../media/platform/renesas/vsp1/vsp1_rwpf.c   | 127 ++++++++++++++----
 .../media/platform/renesas/vsp1/vsp1_rwpf.h   |   6 +-
 .../media/platform/renesas/vsp1/vsp1_sru.c    |  63 ++++-----
 .../media/platform/renesas/vsp1/vsp1_uds.c    |  62 ++++-----
 .../media/platform/renesas/vsp1/vsp1_uif.c    |  40 ++----
 .../media/platform/renesas/vsp1/vsp1_wpf.c    |  13 +-
 17 files changed, 442 insertions(+), 379 deletions(-)


base-commit: a93a51f42ac354425a252210183c4151d991f75d
-- 
Regards,

Laurent Pinchart


