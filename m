Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE16D2EABEB
	for <lists+linux-media@lfdr.de>; Tue,  5 Jan 2021 14:30:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbhAEN2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Jan 2021 08:28:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbhAEN2m (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Jan 2021 08:28:42 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE093C061795
        for <linux-media@vger.kernel.org>; Tue,  5 Jan 2021 05:28:01 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id ce23so41164651ejb.8
        for <linux-media@vger.kernel.org>; Tue, 05 Jan 2021 05:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0xa5-net.20150623.gappssmtp.com; s=20150623;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :to;
        bh=yw0mpq+FlB76NGSsZP+stgJps3/ttAwpUeq5Blas590=;
        b=sPr1liK2XbGukSAHPnYlrNAGrC1Md2XX7pS9zXwyYEIf0+Al3JWmd+1omnH+XWkJKV
         ROGb8yJrwQUCrWu5BGDDHeTTD9PxupuTEI19rpee/JOrWEp2nfPCWtW14OsiS1428CyQ
         /WaR1zXD2vWMvys2uraE+0eC7QCD+pGgMeP4qBFK5iP5teJpshZhIt32+RBrQByhaEFy
         L/vJOgNRvjYGu5bs/7B0nC3/NvnABctsGx3UriMWvwEXDExezC8xq8J162WCqkdCkgGf
         NVhO4SVvYB8uMIU4Km5GViRv3vjR1z4zz3ASu1KiiN5Q2KMctP7NFRXd8OEwq2g5ctnh
         NMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:to;
        bh=yw0mpq+FlB76NGSsZP+stgJps3/ttAwpUeq5Blas590=;
        b=Mm7da5NIEoxgwc6iwv4dPs4sfsysv809HvxCaSEZDRH9kms1J8HDznBLv+B2o3mta8
         lfmehCrR3hRJQUQD+4cjj/Uet1NsiHpQZhkZqYJm6JdDNWCkfkgrcrLNTT/FY3dMBKfr
         q4ZFS7tf/2tlh8mQtQB/g1xMXqbx6+pfI4tMoHErjZWRTjMdAXjmzi3a28u4zZf80Fao
         +sUOGTUX7lhlvXFdzqaPbMU124mpqQxhjOmtZ4bZPw5EDkFhbhxOR93QEBGMzWiyIIU1
         qtbzbrtXgCio5nWKzSYrOsyUp1Sc6eMCqRsE3RyruHZPsAeA2F7rLsSa/C7fAKZZTo5u
         qtKA==
X-Gm-Message-State: AOAM532cdE7tS3PEHPKBcgY4FMqzfbETRopq7dIsp25AwqJJjY4yQ01p
        /XqCUC6XNHv/ebtuWnR/BsgGPtCn+QeKCEzUcPU=
X-Google-Smtp-Source: ABdhPJwAYX2jobvE3G5ZScEHnITpaZD5BiMY1KA59l3+cmqjJU+mHT42QOw0HVxzg3sYNKIrcUSlRQ==
X-Received: by 2002:a17:906:4e52:: with SMTP id g18mr72766794ejw.385.1609853280372;
        Tue, 05 Jan 2021 05:28:00 -0800 (PST)
Received: from nafta.home (52-147.dsl.iskon.hr. [89.164.52.147])
        by smtp.gmail.com with ESMTPSA id p3sm24644538ejx.0.2021.01.05.05.27.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 05:27:59 -0800 (PST)
From:   Damjan Marion <dmarion@0xa5.net>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: heap buffer overflow during dvbv5-scan
Message-Id: <3ADCE93B-7FE1-4A61-88DC-7F7EF5696A99@0xa5.net>
Date:   Tue, 5 Jan 2021 14:27:58 +0100
To:     linux-media@vger.kernel.org
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


Hi,

i=E2=80=99m experiencing heap buffer overflow when I use dvbv5-scan.

I tried with latest v4l-utils master, kernel 5.8.0-31.

card:
[2932932.804279] si2168 2-0064: Silicon Labs Si2168-D60 successfully =
identified
[2932932.804282] si2168 2-0064: firmware version: D 6.0.1
[2932932.808400] si2157 3-0060: Silicon Labs Si2141 successfully =
attached
[2932963.129981] si2168 2-0064: downloading firmware from file =
'dvb-demod-si2168-d60-01.fw'
[2932963.555566] si2168 2-0064: firmware version: D 6.0.2
[2932963.573916] si2157 3-0060: found a 'Silicon Labs Si2141-A10'
[2932963.573969] si2157 3-0060: downloading firmware from file =
'dvb-tuner-si2141-a10-01.fw'
[2932964.054795] si2157 3-0060: firmware version: 1.1.10
[2932964.075497] si2168 2-0064: downloading firmware from file =
'dvb-demod-si2168-d60-01.fw'
[2932964.504849] si2168 2-0064: firmware version: D 6.0.2

Backtrace:

(gdb) bt
#0  __GI_raise (sig=3Dsig@entry=3D6) at =
../sysdeps/unix/sysv/linux/raise.c:49
#1  0x00007ffff7c6e864 in __GI_abort () at abort.c:79
#2  0x00007ffff7cd1af6 in __libc_message (action=3Daction@entry=3Ddo_abort=
, fmt=3Dfmt@entry=3D0x7ffff7df9128 "%s\n") at =
../sysdeps/posix/libc_fatal.c:155
#3  0x00007ffff7cda46c in malloc_printerr (str=3Dstr@entry=3D0x7ffff7df740=
9 "realloc(): invalid next size") at malloc.c:5389
#4  0x00007ffff7cde41c in _int_realloc (av=3Dav@entry=3D0x7ffff7e2bba0 =
<main_arena>, oldp=3Doldp@entry=3D0x5555555aa4a0, =
oldsize=3Doldsize@entry=3D832, nb=3D832) at malloc.c:4601
#5  0x00007ffff7ce0056 in __GI___libc_realloc (oldmem=3D0x5555555aa4b0, =
bytes=3D816) at malloc.c:3246
#6  0x000055555557fc8d in dvb_desc_t2_delivery_init =
(parms=3D0x5555555a1930, buf=3D0x5555555a7f8d "", ext=3D<optimized out>, =
desc=3D0x5555555b5b80) at descriptors/desc_t2_delivery.c:86
#7  0x0000555555581dd9 in dvb_extension_descriptor_init =
(parms=3Dparms@entry=3D0x5555555a1930, buf=3Dbuf@entry=3D0x5555555a7f8c =
"\004", desc=3Ddesc@entry=3D0x5555555b5b60) at =
descriptors/desc_extension.c:159
#8  0x00005555555789c3 in dvb_desc_parse =
(parms=3Dparms@entry=3D0x5555555a1930, buf=3Dbuf@entry=3D0x5555555a7f6a =
"A\030\003\351\037\003\352\037\003\353\037\003\354\037\003\355\037\003\356=
\037\003\357\037\003\360\037_\004", buflen=3Dbuflen@entry=3D106,
    head_desc=3Dhead_desc@entry=3D0x5555555b50c6) at descriptors.c:195
#9  0x000055555557a439 in dvb_table_nit_init (parms=3D0x5555555a1930, =
buf=3D0x5555555a7f50 "@\360\205\061", <incomplete sequence \325>, =
buflen=3D<optimized out>, table=3D<optimized out>) at tables/nit.c:120
#10 0x0000555555575a96 in dvb_parse_section (buf_length=3D136, =
buf=3D0x5555555a7f50 "@\360\205\061", <incomplete sequence \325>, =
sect=3D0x7fffffffe0f0, parms=3D0x5555555a1930) at dvb-scan.c:281
#11 dvb_read_sections (__p=3D__p@entry=3D0x5555555a1930, =
dmx_fd=3Ddmx_fd@entry=3D4, sect=3Dsect@entry=3D0x7fffffffe0f0, =
timeout=3D4294959072, timeout@entry=3D12) at dvb-scan.c:384
#12 0x0000555555576acd in dvb_read_section_with_id (timeout=3D12, =
table=3D0x5555555b5f00, ts_id=3D-1, pid=3D16, tid=3D64 '@', dmx_fd=3D4, =
parms=3D0x5555555a1930) at dvb-scan.c:409
#13 dvb_read_section (timeout=3D12, table=3D0x5555555b5f00, pid=3D16, =
tid=3D64 '@', dmx_fd=3D4, parms=3D0x5555555a1930) at dvb-scan.c:102
#14 dvb_get_ts_tables (__p=3D__p@entry=3D0x5555555a1930, =
dmx_fd=3Ddmx_fd@entry=3D4, delivery_system=3D<optimized out>, =
other_nit=3Dother_nit@entry=3D0, =
timeout_multiply=3Dtimeout_multiply@entry=3D1) at dvb-scan.c:582
#15 0x000055555557733b in dvb_scan_transponder =
(__p=3D__p@entry=3D0x5555555a1930, entry=3D0x5555555a8f60, dmx_fd=3D4, =
check_frontend=3D0x555555567b70 <check_frontend>, args=3D0x7fffffffe280, =
other_nit=3D0, timeout_multiply=3D1) at dvb-scan.c:690
#16 0x0000555555568a95 in dvb_local_scan (open_dev=3D<optimized out>, =
entry=3D<optimized out>, check_frontend=3D<optimized out>, =
args=3D<optimized out>, other_nit=3D<optimized out>, =
timeout_multiply=3D<optimized out>) at dvb-dev-local.c:789
#17 0x0000555555566fb3 in run_scan (dvb=3D0x7fffffffe228, =
args=3D0x7fffffffe280) at dvbv5-scan.c:298
#18 main (argc=3D<optimized out>, argv=3D<optimized out>) at =
dvbv5-scan.c:562


Address sanitizer:

Lock   (0x1f) C/N=3D 29.75dB UCB=3D 0 postBER=3D 74.0x10^-3
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=3D=3D2140614=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on =
address 0x62100005ed00 at pc 0x5555555f50a7 bp 0x7fffffffd410 sp =
0x7fffffffd400
READ of size 1 at 0x62100005ed00 thread T0
    #0 0x5555555f50a6 in dvb_desc_t2_delivery_init =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0xa10a6)
    #1 0x55555560152c in dvb_extension_descriptor_init =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0xad52c)
    #2 0x5555555d4430 in dvb_desc_parse =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x80430)
    #3 0x5555555dc870 in dvb_table_nit_init =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x88870)
    #4 0x5555555ca85d in dvb_parse_section =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x7685d)
    #5 0x5555555cbdab in dvb_read_sections =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x77dab)
    #6 0x5555555cc065 in dvb_read_section_with_id =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x78065)
    #7 0x5555555c873f in dvb_read_section =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x7473f)
    #8 0x5555555cd772 in dvb_get_ts_tables =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x79772)
    #9 0x5555555ce8c2 in dvb_scan_transponder =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x7a8c2)
    #10 0x55555559ff5c in dvb_local_scan =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x4bf5c)
    #11 0x555555598904 in dvb_dev_scan =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x44904)
    #12 0x5555555949b0 in run_scan =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x409b0)
    #13 0x555555596a0c in main =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x42a0c)
    #14 0x7ffff729ecb1 in __libc_start_main =
(/lib/x86_64-linux-gnu/libc.so.6+0x28cb1)
    #15 0x555555592f4d in _start =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x3ef4d)

0x62100005ed00 is located 0 bytes to the right of 4096-byte region =
[0x62100005dd00,0x62100005ed00)
allocated by thread T0 here:
    #0 0x7ffff76876e7 in calloc =
(/usr/lib/x86_64-linux-gnu/libasan.so.6+0xb06e7)
    #1 0x5555555cb5a6 in dvb_read_sections =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x775a6)
    #2 0x5555555cc065 in dvb_read_section_with_id =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x78065)
    #3 0x5555555c873f in dvb_read_section =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x7473f)
    #4 0x5555555cd772 in dvb_get_ts_tables =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x79772)
    #5 0x5555555ce8c2 in dvb_scan_transponder =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x7a8c2)
    #6 0x55555559ff5c in dvb_local_scan =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x4bf5c)
    #7 0x555555598904 in dvb_dev_scan =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x44904)
    #8 0x5555555949b0 in run_scan =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x409b0)
    #9 0x555555596a0c in main =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0x42a0c)
    #10 0x7ffff729ecb1 in __libc_start_main =
(/lib/x86_64-linux-gnu/libc.so.6+0x28cb1)

SUMMARY: AddressSanitizer: heap-buffer-overflow =
(/home/damarion/src/v4l-utils/utils/dvb/dvbv5-scan+0xa10a6) in =
dvb_desc_t2_delivery_init
Shadow bytes around the buggy address:
  0x0c4280003d50: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c4280003d60: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c4280003d70: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c4280003d80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  0x0c4280003d90: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
=3D>0x0c4280003da0:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c4280003db0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c4280003dc0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c4280003dd0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c4280003de0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
  0x0c4280003df0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
Shadow byte legend (one shadow byte represents 8 application bytes):
  Addressable:           00
  Partially addressable: 01 02 03 04 05 06 07
  Heap left redzone:       fa
  Freed heap region:       fd
  Stack left redzone:      f1
  Stack mid redzone:       f2
  Stack right redzone:     f3
  Stack after return:      f5
  Stack use after scope:   f8
  Global redzone:          f9
  Global init order:       f6
  Poisoned by user:        f7
  Container overflow:      fc
  Array cookie:            ac
  Intra object redzone:    bb
  ASan internal:           fe
  Left alloca redzone:     ca
  Right alloca redzone:    cb
  Shadow gap:              cc
=3D=3D2140614=3D=3DABORTING

Will be glad to debug this further but I will need a bot of =
assistance=E2=80=A6.

Thanks,

Damjan



