Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D03DC4CEEDA
	for <lists+linux-media@lfdr.de>; Mon,  7 Mar 2022 00:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233117AbiCFX7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Mar 2022 18:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiCFX7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Mar 2022 18:59:37 -0500
Received: from smtpormsvr01.oricom.ca (smtpormsvr01.oricom.ca [64.18.172.221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1611117A97
        for <linux-media@vger.kernel.org>; Sun,  6 Mar 2022 15:58:45 -0800 (PST)
Received: from moncourrier.oricom.ca (ormhostsvr01.oricom.ca [192.168.120.120])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: patrice.st-gelais@oricom.ca)
        by smtpormsvr01.oricom.ca (Postfix) with ESMTPSA;
        Sun,  6 Mar 2022 18:58:43 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=oricom.ca; s=default;
        t=1646611124; bh=9MOrDUG097wflP65gOxpkv3jBckhl/6CrakAwMp7Jq0=;
        h=Date:From:To:Subject:From;
        b=Z07BGVf+P4PHeveDOfeV7G2wJRYc1/M3O7CiCiQpUL3RvPcvoQb6wLlLzsXcIIp0h
         iNdn+vfUkQIGr2quOaHf89VAYFwIroa6GQlw8IzA9o99m9fG8PSWP2YVJaxdxyBQrQ
         +o5BuurPm85r5XiTTs2qXh+0XEklRuVK+il9Fw4IoMTQ0zYV1JLmp45q1YfUTjyXs6
         J+4HzOHKI/v7mnU0btJeeFhQ310ftQ1thT3Eun5977u3P9MQfmg0ZwOvxoA4qwoTlc
         pmycAuhn18+ZpYFNsYMNveUH3I4DDg4EfR0W7D8g+gWhdCcwRf+S6iAkodd8WpcmE6
         uiLQNLQzOA4CSMaRA/3fVbGyt3cAMlIHg+x9lgDE7vUh5xd88/Evjk1j25l5z0ZqEH
         pQRxo1n9yXYQAb0AdkO4gT/bT19BLm0h136XB980XgIA7HAIGEh2erdTqTA7x4XQQl
         vslojlwk40goVRls6HmgxGIUoz/AqYJ6j6+nmyFVt1stmprOO+4+ikPa8HKSmIhgc7
         ImKVfx51B5d9vbmAXANME7EK6VFsGTEUkSUyj4MKzyskGnvtn1xlNSkJAKLRTU2Nj1
         QX/izTKGlBYJ1XOIRP9vFVjec6Oa6GVbZ4bAeEbgEqEkTEG16aXJ+HJXgv8ph1lGi+
         ynp3FXpC+jWoRHPUA3QLmepQ=
Received: from 56.104.137.216.v.cable.oricom.ca ([216.137.104.56])
 by moncourrier.oricom.ca
 with HTTP (HTTP/1.1 POST); Sun, 06 Mar 2022 18:58:43 -0500
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="=_e61269431aad355999cf82166114cd2f"
Content-Transfer-Encoding: 8bit
Date:   Sun, 06 Mar 2022 18:58:43 -0500
From:   <patrice.st-gelais@oricom.ca>
To:     linux-media@vger.kernel.org
Subject: =?UTF-8?Q?Digital_TV_scan_table_for_Qu=C3=A9bec_City?=
User-Agent: Oricom Webmail
Message-ID: <64a3f490769ab7a99c390e4a14e754c6@oricom.ca>
X-Sender: patrice.st-gelais@oricom.ca
X-Remote-Browser: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:97.0)
 Gecko/20100101 Firefox/97.0
X-Originating-IP: [216.137.104.56]
X-RoundCube-Server: 192.168.120.120
X-Originating-User: patrice.st-gelais@oricom.ca
X-AV-Checked: AV @ ORM
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--=_e61269431aad355999cf82166114cd2f
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed

Hi,

I send you the attached scan table following the instructions on the 
"Files" section of the Kaffeine wiki page on linuxtv-dot-org.

I am using Kaffeine with a newly installed PCI tuner and one channel was 
missing when scanning from scanfile.dvb, [atsc/ca-ON-Toronto] or 
[atsc/us-ATSC-center-frequencies-8VSB].

This is how I copied the data in my local scanfile.dvb to get it work:

[atsc/ca-QC-Québec]
A 479000000 8VSB
A 491000000 8VSB
A 539000000 8VSB
A 599000000 8VSB

The 4 last lines are the output of w_scan with the -x option, the 
attached file is a DVBV5 conversion with dvb-format-convert.

I hope this is ok.

Thanks!

Patrice St-Gelais

--=_e61269431aad355999cf82166114cd2f
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=us-ascii;
 name*=UTF-8''ca-QC-Qu%C3%A9bec
Content-Disposition: attachment;
 filename*=UTF-8''ca-QC-Qu%C3%A9bec;
 size=921

Iy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQojIGxvY2F0aW9uCQk6IFF1w6liZWMsIFFjLCBDYW5hZGEK
IyBwcm92aWRlcgkJOiBPVEEKIyBkYXRlICh5eXl5LW1tLWRkKSAgICAJOiAyMDIyLTAzLTA1CiMg
cHJvdmlkZWQgYnkgKG9wdCkgICAgCTogcGF0cnN0Z0B1c2Vycy5zb3VyY2Vmb3JnZS5uZXQKIwoj
IERpZ2l0YWwgY2hhbm5lbHMgYXZhaWxhYmxlIGluIFF1w6liZWMgQ2l0eSBhcyBzY2FubmVkIHdp
dGggd19zY2FuCiMgSW5kb29yIGFudGVubmEsIGRvd250b3duCiMtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KCiMgQ0lWUS1IRCwgVMOpbMOpLVF1w6liZWMgW1RRXSwgY2guIDE1CltDSEFOTkVMXQoJREVM
SVZFUllfU1lTVEVNID0gQVRTQwoJRlJFUVVFTkNZID0gNDc5MDAwMDAwCglNT0RVTEFUSU9OID0g
VlNCLzgKCUlOVkVSU0lPTiA9IEFVVE8KCiMgQ0ZDTS1IRCwgVFZBLCBjaC4gMTcKW0NIQU5ORUxd
CglERUxJVkVSWV9TWVNURU0gPSBBVFNDCglGUkVRVUVOQ1kgPSA0OTEwMDAwMDAKCU1PRFVMQVRJ
T04gPSBWU0IvOAoJSU5WRVJTSU9OID0gQVVUTwoKIyBDQlZULURULCBJY2kgUmFkaW8tQ2FuYWRh
IFtTUkNdLCBjaC4gMjUKW0NIQU5ORUxdCglERUxJVkVSWV9TWVNURU0gPSBBVFNDCglGUkVRVUVO
Q1kgPSA1MzkwMDAwMDAKCU1PRFVMQVRJT04gPSBWU0IvOAoJSU5WRVJTSU9OID0gQVVUTwoKIyBD
RkFQLURULCBOT09WTyBbVl0sIGNoLiAzOQpbQ0hBTk5FTF0KCURFTElWRVJZX1NZU1RFTSA9IEFU
U0MKCUZSRVFVRU5DWSA9IDU5OTAwMDAwMAoJTU9EVUxBVElPTiA9IFZTQi84CglJTlZFUlNJT04g
PSBBVVRPCgoK
--=_e61269431aad355999cf82166114cd2f--
