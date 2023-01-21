Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7CE167670A
	for <lists+linux-media@lfdr.de>; Sat, 21 Jan 2023 16:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbjAUPOT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 21 Jan 2023 10:14:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjAUPOR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 21 Jan 2023 10:14:17 -0500
X-Greylist: delayed 183 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 21 Jan 2023 07:14:16 PST
Received: from wrqvqxbs.outbound-mail.sendgrid.net (wrqvqxbs.outbound-mail.sendgrid.net [149.72.74.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD88E23C4C
        for <linux-media@vger.kernel.org>; Sat, 21 Jan 2023 07:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bbqporkmccity.com;
        h=from:content-type:content-transfer-encoding:mime-version:subject:to:
        cc:content-type:from:subject:to;
        s=s1; bh=jmWzb2vcpHT9lLZnzH2lriUZs6uGdgB6EtsG7iLAq48=;
        b=BtuLp/KCNafo+GSlCFGfNYcreKCsdn4yy/yNmxJndvWjs7dUL1vFuLtyzdnUAzf+ma9a
        Ra4URHDnZOQj7JIDk448MQo+mG89FlQud/b5rRsRQf524XIJUdGK38xCH5fxiXxI3fkeW6
        YueWH99WS9YU5PuKtLq2HK7CGb8usuOsoH90qcTazieDihA9x11T+jOYkUKPpPceGAfFg8
        KBuHXp4M2YRcuC7OGIRSOJJ4FxQizAp9Xg7V7uDKeJdplqblGMv0yedxOjKoYv8DBYbbKT
        Eeen41h3BDp/g7xsoFB0sJ8pWytjMeE5iXgDivFZU3T15g7aHE8ZJAbsHt9TfNUg==
Received: by filterdrecv-69c5db5cf4-7l2sn with SMTP id filterdrecv-69c5db5cf4-7l2sn-1-63CC0090-28
        2023-01-21 15:11:13.103001912 +0000 UTC m=+5587384.564747271
Received: from smtpclient.apple (unknown)
        by geopod-ismtpd-canary-0 (SG)
        with ESMTP id WzAN5ECBTA-h2tD-MmCDhQ
        for <linux-media@vger.kernel.org>;
        Sat, 21 Jan 2023 15:11:12.585 +0000 (UTC)
From:   j8bukhwh@bbqporkmccity.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.96\))
Subject: Error while cross compiling dub frontend drivers
Message-Id: <CE993547-9084-4500-A255-A6163CD4632D@bbqporkmccity.com>
Date:   Sat, 21 Jan 2023 15:11:13 +0000 (UTC)
X-Mailer: Apple Mail (2.3731.300.96)
X-SG-EID: =?us-ascii?Q?qDF0gT+h7gcMMLH5gNXZVHSXFzfMnoAhN=2Fj7OXiq7TsYuoD0rgDi4Nc62jO34C?=
 =?us-ascii?Q?fah41L2J+RSJA066KTqxA8cyNu3aOVJ65qP+pZw?=
 =?us-ascii?Q?fRHbcMSZEOYTtO+5B3aRcJPipUrAMHDVfogImbM?=
 =?us-ascii?Q?l23TDRcHEh1VDRFA=2FY42F1nEbr7IHegjpuMBG=2F0?=
 =?us-ascii?Q?7vPobmVfSafh1p2EoTEJ4v3PB8HQ78J7RWu=2F+Rt?=
 =?us-ascii?Q?99fcEaLc4mV0hdTrY=3D?=
To:     linux-media@vger.kernel.org
X-Entity-ID: eBISQ2q9MRBsaWauIRDPgA==
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I am trying to cross compile a DVB frontend, but I got this error:



root@dvb:~/dvb/linux_media/drivers/media/dvb-frontends# make -C /root/kerne=
lbuild/linux/ M=3D$PWD modules -j12
make: Entering directory '/root/kernelbuild/linux'
  CC [M]  /root/dvb/linux_media/drivers/media/dvb-frontends/gx1503.o
  MODPOST /root/dvb/linux_media/drivers/media/dvb-frontends/Module.symvers
ERROR: modpost: "i2c_mux_add_adapter" [/root/dvb/linux_media/drivers/media/=
dvb-frontends/gx1503.ko] undefined!
ERROR: modpost: "i2c_mux_alloc" [/root/dvb/linux_media/drivers/media/dvb-fr=
ontends/gx1503.ko] undefined!
ERROR: modpost: "i2c_mux_del_adapters" [/root/dvb/linux_media/drivers/media=
/dvb-frontends/gx1503.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:123: /root/dvb/linux_media/drivers/m=
edia/dvb-frontends/Module.symvers] Error 1
make[1]: *** Deleting file '/root/dvb/linux_media/drivers/media/dvb-fronten=
ds/Module.symvers'
make: *** [Makefile:1741: modules] Error 2
make: Leaving directory '/root/kernelbuild/linux'



The `i2c_mux_add_adapter` exists in=20



root@dvb:~/kernelbuild/linux/drivers/i2c# ls -la | grep i2c-mux.ko
-rw-r--r--   1 root root     284 Jan 21 19:16 .i2c-mux.ko.cmd
-rw-r--r--   1 root root  312168 Jan 21 19:16 i2c-mux.ko


root@dvb:~/kernelbuild/linux/drivers/i2c# readelf -a i2c-mux.ko | grep -i i=
2c_mux_add_adapter
000000000000  005e00000002 R_X86_64_PC32     0000000000000690 i2c_mux_add_a=
dapter + 0
    59: 0000000000000000   174 FUNC    LOCAL  DEFAULT    5 i2c_mux_add_adap=
ter.cold.
    94: 0000000000000690   843 FUNC    GLOBAL DEFAULT    3 i2c_mux_add_adap=
ter

root@dvb:~/kernelbuild/linux/drivers/i2c# readelf -a i2c-mux.ko | grep -i i=
2c_mux_alloc
00000000000c  005400000002 R_X86_64_PC32     0000000000000090 i2c_mux_alloc=
 + 0
    37: 0000000000000012     0 NOTYPE  LOCAL  DEFAULT    9 __kstrtab_i2c_mu=
x_alloc
    38: 0000000000000020     0 NOTYPE  LOCAL  DEFAULT    9 __kstrtabns_i2c_=
mux_alloc
    39: 000000000000000c     0 NOTYPE  LOCAL  DEFAULT    7 __ksymtab_i2c_mu=
x_alloc
    84: 0000000000000090   204 FUNC    GLOBAL DEFAULT    3 i2c_mux_alloc

root@dvb:~/kernelbuild/linux/drivers/i2c# readelf -a i2c-mux.ko | grep -i i=
2c_mux_del_adapters
000000000018  005b00000002 R_X86_64_PC32     00000000000005d0 i2c_mux_del_a=
dapters + 0
    91: 00000000000005d0   188 FUNC    GLOBAL DEFAULT    3 i2c_mux_del_adap=
ters


any idea how to fix those errors?
