Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E51DBA53
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 18:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbgETQzI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 20 May 2020 12:55:08 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:40441 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbgETQzH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 12:55:07 -0400
IronPort-SDR: e3HA8pmJQpkxv7MGRIhdhcU/hpwGp6nC/SW0W82gYW1kEyLLyifqEJVDv0n4U+YzL7v4E3SQ/t
 6gUV5fGsd5iSmvacOOVEfA1TZDX39gW12WgMAhA8r+xs9fK4KueRwcXGkhrrCNqZ8nDbnTCp2z
 K0CcU1Vk+9SFPd8Ts4O1/JCE/Ce3QATpSp9loJuzlwsC0d1pn3R9ENVtE4xfO8ct8JmKE9olI6
 8+IsZ94Nk2kKECLScU08V0O2FVzvKbsNGxHjiqEocfpFK3lieIgIaVPW1M3JZGjRTn6pAaBNDA
 jaA=
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="49042948"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 20 May 2020 08:55:07 -0800
IronPort-SDR: sBklAC3Wavks73Qtj9wFhhRzEJdGZ/wNdUlUAOjkvbkfydoNuePtXJtsgCiGerEkdL3SBrSlaL
 keKzvVJ48xLKycBD86748nCOX6kX/4+V+egk5LW16HMQ2YBV0mZrXWSQdB0f0rdtU5b2pJ2jxP
 +8IhDCSbJuuvysgohelu8j3Fr2WG5vt/aRlSSLZEk1Ljh/BXD1qGBLeI51hnehMlbQGFOgl9rt
 xPuNoD2PzYOkp5L0oftO6NuI7JGOY2GedWaQEwiRwtgX5flU7VOLsY7NnogRRdjRPVueoPZI4R
 k/U=
From:   "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: [v4l-utils] Error in `media-ctl': double free or corruption (fasttop)
Thread-Topic: [v4l-utils] Error in `media-ctl': double free or corruption
 (fasttop)
Thread-Index: AdYux0+ElC5nWFbRTJ2KBnkFxFHJNQ==
Date:   Wed, 20 May 2020 16:55:01 +0000
Message-ID: <b8dfe007970b4df49237b3e839013939@SVR-IES-MBX-03.mgc.mentorg.com>
Accept-Language: en-US, en-IE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [137.202.0.90]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

         When executing command "media-ctl -d /dev/media0 -p" crash is observed
very rarely in media_enum_links() while freeing memory with the below backtrace:

****** EXCEPTION in process PID=1682 (media-ctl) *******
Command line: media-ctl -d /dev/media0 -p 
exception trigger PROCESS_SIGNAL
signal "SIGABRT"
Signal info:
               si_signo:6
               si_errno:0
               si_code:0xfffffffa
====== processor registers:
x0-x9:   0000000000000000 0000ffffcc0c7780 0000000000000000 0000000000000008 0000000000000000 0000ffffcc0c7780 ffffffffffffffff ffffffffffffffff 0000000000000087 ffffffffffffffff
x10-x19: ffffffffffffffff ffffffffffffffff ffffffffffffffff ffffffffffffffff 0000000000000000 0000000000000000 0000ffff817b8f70 0000ffff816af8e0 0000ffff81787a70 0000000000000006
x20-x29: 0000ffff817fc010 0000ffff817fb000 0000ffffcc0c79b0 0000000000000002 0000000000000001 0000ffff8175d8b8 0000000000000002 0000ffffcc0c79e0 0000000000000001 0000ffffcc0c7760
x30: 0000ffff8166b038 sp: 0000ffffcc0c7760 pc: 0000ffff8166b0ac pstate: 0000000000000000 orig_x0: 0000000000000002 syscallno: 00000000ffffffff

backtrace:
---
Extracted from stack:
/lib64/libc-2.27.so(raise+0x9c)[0xffff8166b0ac]
/lib64/libc-2.27.so(abort+0x140)[0xffff8166c160]
/lib64/libc-2.27.so(abort+0x9c)[0xffff8166c0bc]
/lib64/libc-2.27.so(__fsetlocking+0x2e8)[0xffff816a4730]
/lib64/ld-2.27.so(_dl_rtld_di_serinfo+0xf70)[0xffff817df428]
/lib64/libc-2.27.so(__fsetlocking+0x2b8)[0xffff816a4700]
/lib64/libc-2.27.so(__libc_thread_freeres+0x17be8)[0xffff8175d8b8]
/lib64/libc-2.27.so(__libc_thread_freeres+0x1bf9a)[0xffff81761c6a]
/lib64/libc-2.27.so(__libc_thread_freeres+0x1bf9a)[0xffff81761c6a]
/lib64/ld-2.27.so(_dl_rtld_di_serinfo+0x4cc4)[0xffff817e317c]
/lib64/libc-2.27.so(__libc_thread_freeres+0x17be8)[0xffff8175d8b8]
/lib64/libc-2.27.so(_IO_str_seekoff+0x4938)[0xffff816aead0]
/lib64/libc-2.27.so(_IO_str_seekoff+0x88c)[0xffff816aaa24]
/lib64/libc-2.27.so(__libc_thread_freeres+0x17be8)[0xffff8175d8b8]
/lib64/libc-2.27.so(_IO_str_seekoff+0x21a0)[0xffff816ac338]
/usr/lib64/libmediactl.so.0.0.0(media_device_enumerate+0x45c)[0xffff817a74ac]
/usr/lib64/libmediactl.so.0.0.0(media_device_enumerate+0x360)[0xffff817a73b0]
/usr/lib64/libmediactl.so.0.0.0(media_device_enumerate+0x45c)[0xffff817a74ac]
/usr/bin/media-ctl(_init+0x3b0)[0x401738]
RA: 0x0000000000000000 BP: 0x0000ffffcc0c7760 SP: 0x0000ffffcc0c9000
Saved registers and local vars (0xffffcc0c8f98 - 0xffffcc0c8ff0):
<0000ffffcc0c8f90>                  5f4452414f420065 4d5f4749464e4f43 6f623d444f485445 636570732d647261 6e79642d63696669 6d6f632d63696d61 0073746e656e6f70         
<0000ffffcc0c8fd0> 622f7273752f3d5f 616964656d2f6e69 73752f006c74632d 656d2f6e69622f72 006c74632d616964

Could the above crash related to commit "libmediactl: Don't free an already freed address if no links".
The commit "Revert "libmediactl: Don't free an already freed address if no links"" reverts the above patch.
Could you please provide more details for reverting the patch.

Thank you,
Regards,
Bhuvanesh
