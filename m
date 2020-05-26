Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7D7C1E2128
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 13:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388373AbgEZLqE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 26 May 2020 07:46:04 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:7833 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728148AbgEZLqE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 07:46:04 -0400
IronPort-SDR: WmyMadqJ545e966Roc+O9cdL/Qd38OPxLovvqSE7NyL9ZOf2WuJE85qK0crJPTTUmLrT0OMaS3
 XFV7hiAFWcWfUguZ3YkNP7m6OprqH09064M5rWYvoqK9TJxe/a0XAVT5PMrjdnJcwG9aNk/8+Z
 9WzXyBaEEtwqVRD3GQtY/UC8VibNG7d9iil7ibZiEWoJZFsiyRXPR3Iep+jOtV6iEbnp6z5c19
 om7zZdKwjCRFqE0trlGPzkQ0LapFk0bd2nhESW3S+/R10AyKyYVCjptHe8gQ8jjJWverAD2pny
 Zgw=
X-IronPort-AV: E=Sophos;i="5.73,437,1583222400"; 
   d="scan'208";a="49256808"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 26 May 2020 03:46:03 -0800
IronPort-SDR: jzrW4Osns9qJBHidQwtnZI1gn/nOwPYJGmE9loPs9qKrdQshjK8WmcuVocadZgnBVo0hB4FhUL
 7JXfuX9Juj+6wqNNvN1A/4cpxOr2+LU0TTtFXZjiCHMNz9O9uXjqAC3B+xrlXHjfYHTGwWEarx
 wZ/Vd8qMzQHEG+8mup9QDjxnTlJGaakPYKnMKo+NPsw62yv80BNvoAZAcYdRmhv7z6zQhZeqec
 7dGd20ZPy0TEq7wDMLhHsfGMp/MrDzDRRg87HzIBIv2QZa2ITvSOA4nXbxoQkNLhqVXmUNaF9N
 NLw=
From:   "Surachari, Bhuvanesh" <Bhuvanesh_Surachari@mentor.com>
To:     "mchehab@osg.samsung.com" <mchehab@osg.samsung.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "Craske, Mark" <Mark_Craske@mentor.com>
Subject: [v4l-utils] Error in `media-ctl': double free or corruption (fasttop)
Thread-Topic: [v4l-utils] Error in `media-ctl': double free or corruption
 (fasttop)
Thread-Index: AdYzUXrBrzjSIjFlSm2gkW2MURI6Vw==
Date:   Tue, 26 May 2020 11:45:58 +0000
Message-ID: <9765b7274c0a43d482ad480ca21c9893@SVR-IES-MBX-03.mgc.mentorg.com>
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

Hello Mauro Carvalho Chehab,

         When executing command "media-ctl -d /dev/media0 -p" crash is observed very rarely in media_enum_links() while freeing memory with the below backtrace:

****** EXCEPTION in process PID=1682 (media-ctl) ******* Command line: media-ctl -d /dev/media0 -p exception trigger PROCESS_SIGNAL signal "SIGABRT"
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
RA: 0x0000000000000000 BP: 0x0000ffffcc0c7760 SP: 0x0000ffffcc0c9000 Saved registers and local vars (0xffffcc0c8f98 - 0xffffcc0c8ff0):
<0000ffffcc0c8f90>                  5f4452414f420065 4d5f4749464e4f43 6f623d444f485445 636570732d647261 6e79642d63696669 6d6f632d63696d61 0073746e656e6f70         
<0000ffffcc0c8fd0> 622f7273752f3d5f 616964656d2f6e69 73752f006c74632d 656d2f6e69622f72 006c74632d616964

The above crash could be related to commit id 112c52c3495713bad522cdf40f285a8e7b38674b ("libmediactl: Don't free an already freed address if no links") which was applied. But the commit id 314a19002e7244e4b8d5576f48cb9198ea8294c6 ("Revert "libmediactl: Don't free an already freed address if no links"") reverts the above patch.

The  commit 112c52c3495713bad522cdf40f285a8e7b38674b ("libmediactl: Don't free an already freed address if no links") seems to help the crash we're seeing, but it was reverted the same day it was applied. Was that by accident or for some other reason?.

Thank you,
Regards,
Bhuvanesh
