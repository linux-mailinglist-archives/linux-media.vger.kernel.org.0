Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3079356AA4A
	for <lists+linux-media@lfdr.de>; Thu,  7 Jul 2022 20:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235635AbiGGSPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jul 2022 14:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbiGGSPS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jul 2022 14:15:18 -0400
X-Greylist: delayed 535 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Jul 2022 11:15:17 PDT
Received: from vault.bonstra.fr.eu.org (vault.bonstra.fr.eu.org [51.158.68.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61EEB27CEB
        for <linux-media@vger.kernel.org>; Thu,  7 Jul 2022 11:15:17 -0700 (PDT)
Received: from val.bonstra.fr.eu.org (unknown [192.168.128.2])
        by vault.bonstra.fr.eu.org (Postfix) with ESMTP id 813D8BFB13;
        Thu,  7 Jul 2022 18:06:19 +0000 (UTC)
Received: from [IPV6:fd7b:45cc:aa3d::3] (vlad.gr1 [IPv6:fd7b:45cc:aa3d::3])
        by val.bonstra.fr.eu.org (Postfix) with ESMTPSA id E7321F07F;
        Thu,  7 Jul 2022 20:06:18 +0200 (CEST)
Authentication-Results: val; dmarc=fail (p=reject dis=none) header.from=bonstra.fr.eu.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bonstra.fr.eu.org;
        s=dkim1; t=1657217179; x=1658426779;
        bh=f0TVdAY/dYO8FA5A04yHKk2pnNYRm2EHLKbCevJOLL0=;
        h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
        b=tiOSq6iYQxMdU1okYcP0DY42unBU5lsU0/cqt4m9YT+pzMkvzAaa4+k30JTQYx5Z+
         5SqRDPbY0ma7U+rapKN/u8TF3JGtnQyBKm3oJgqGMkm1M4BpnW8WnUlXb4JRon3ix4
         W/QtZuC8WPQDa/6dgC2sFZpEzmS41+kHLOflr1lPM8y3Dk6vUK9vXBgC6DF1G+0AWO
         KclFVS+7zbNklCy7+8j7fe/uyElX8yyZNRYZRVpJnb1+cy0vfyB9++9QCTnPsjwRLe
         5I7psrSLY8kE1a77Azxn5iXojndQGzMRJUu7fwI+Wsht2bodARw/mHOIBVqUweM/AB
         iK7qJ3uCmdV+g==
Content-Type: multipart/mixed; boundary="------------skNra0DffOPh6XpKdwe4fASd"
Message-ID: <0ab3655e-452e-979a-d035-f63c1161e668@bonstra.fr.eu.org>
Date:   Thu, 7 Jul 2022 20:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Fwd: Help supporting IT9910 chipset
Content-Language: en-IE
To:     Juan Antonio Zuloaga Mellino <jzuloaga@fi.uba.ar>
References: <CALFMp8vtr3jjGApAoehc4vuS9mNprtGqrRd2+tSfCHbTTKj4og@mail.gmail.com>
 <CALFMp8sXqJLw3MUvvAKztKWU_HyrSNEkDE0TA-UDDwVuwGF9AQ@mail.gmail.com>
From:   "Hugo \"Bonstra\" Grostabussiat" <bonstra@bonstra.fr.eu.org>
Cc:     linux-media@vger.kernel.org
In-Reply-To: <CALFMp8sXqJLw3MUvvAKztKWU_HyrSNEkDE0TA-UDDwVuwGF9AQ@mail.gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------skNra0DffOPh6XpKdwe4fASd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 29/06/2022 à 23:49, Juan Antonio Zuloaga Mellino a écrit :
> Hi. I've an ezcap295hd. It's an usb video grabber based on the IT9910
> chipset manufactured by ITE Tech. Inc.
> 
> I wasn't able to find linux support for it. Is anybody working on it?

I did some reverse engineering on my IT9910 based video grabber, a 
generic model labeled "Awisio Game Capture v5".

I wrote a ugly Rust program to test my findings: 
https://github.com/Bonstra/it9910-stream-example
For my device, it is enough to output the MPEG TS stream to stdout, and 
pipe it into mpv.
It is possible that it won't work for other IT9910 devices because of 
differences in the firmware.

There is still some work to do to understand the meaning of various data 
blobs used as-is in the test program.

I also attempted to list all the USB properties I could find. I attached 
that tentative list to this email. Stay away from the firmware update 
properties :)

I don't plan on writing a Linux driver, at least not until I understand 
the inner workings of that device.

I hope the resources I provided will help.

Regards
--
Hugo
--------------skNra0DffOPh6XpKdwe4fASd
Content-Type: text/plain; charset=UTF-8; name="it9910-usb-props.txt"
Content-Disposition: attachment; filename="it9910-usb-props.txt"
Content-Transfer-Encoding: base64

PSBVU0IgcHJvcGVydHkgcmVxdWVzdHMgPQoKT2Zmc2V0CU5hbWUJCVNpemUJRGVzY3JpcHRp
b24KMHgwMAlsZW4JCTQJTGVuZ3RoIG9mIGZ1bGwgcHJvcGVydHkgcmVxdWVzdAoweDA0CW9w
Y29kZQkJMglPcGVyYXRpb24gY29kZQoweDA2CXNpZwkJMgkweDk5MTAKMHgwOAlvcGVyYXRp
b24JNAkweDEgPSBHRVQsIDB4MiA9IFNFVAoweDBjCXNlcQkJMglTZXF1ZW5jZSBudW1iZXIK
MHgwZQlzaWcJCTIJMHg5OTEwCjB4MTAJZGF0YQkJbGVuLTE2CURhdGEKCj09IE9wY29kZXMg
PT0KCj09PSBSZWJvb3QgKDB4MSkgPT09CgpMZW5ndGg6IDB4MTAKU3VwcG9ydGVkIG9wZXJh
dGlvbnM6CglHRVQgKDEpOiBVbmtub3duCglTRVQgKDIpOiBZZXMKCj09PSBHZXQvU2V0IHN0
YXRlICgweDIpID09PQoKTGVuZ3RoOiAweDE0ClN1cHBvcnRlZCBvcGVyYXRpb25zOgoJR0VU
ICgxKTogVW5rbm93bgoJU0VUICgyKTogWWVzCgpPZmZzZXQJTmFtZQkJU2l6ZQlEZXNjcmlw
dGlvbgoweDEwCT8JCTQJPwoKPT09IEdldC9TZXQgc291cmNlICgweDMpID09PQoKTGVuZ3Ro
OiAweDE4ClN1cHBvcnRlZCBvcGVyYXRpb25zOgoJR0VUICgxKTogWWVzCglTRVQgKDIpOiBZ
ZXMKCk9mZnNldAlOYW1lCQlTaXplCURlc2NyaXB0aW9uCjB4MTAJYXVkaW9fc291cmNlCTQJ
QXVkaW8gc291cmNlOgoJCQkJMDogRGlnaXRhbCAxCgkJCQkxOiBEaWdpdGFsIDIgKHJlc2Vy
dmVkKQoJCQkJMjogQW5hbG9nCjB4MTQJdmlkZW9fc291cmNlCTQJVmlkZW8gc291cmNlOgoJ
CQkJMDogRGlnaXRhbAoJCQkJMTogQW5hbG9nIFlyWWJZCgkJCQkyOiBBbmFsb2cgY29tcG9z
aXRlCgkJCQkzOiBBbmFsb2cgUy9WaWRlbwoJCQkJNDogQW5hbG9nIFJHQgoKPT09IFNldCBm
aXJtd2FyZSBzaXplICgweDUpID09PQoKTGVuZ3RoOiAweDE0ClN1cHBvcnRlZCBvcGVyYXRp
b25zOgoJR0VUICgxKTogVW5rbm93bgoJU0VUICgyKTogWWVzCgpPZmZzZXQJTmFtZQkJU2l6
ZQlEZXNjcmlwdGlvbgoweDEwCWZpcm13YXJlX3NpemUJNAlGaXJtd2FyZSBzaXplLCBJIGd1
ZXNzCgo9PT0gU2V0IGZpcm13YXJlIGRhdGEgKDB4NikgPT09CgpMZW5ndGg6IDB4MTAgbWlu
LCAweDIwMCBtYXgKU3VwcG9ydGVkIG9wZXJhdGlvbnM6CglHRVQgKDEpOiBVbmtub3duCglT
RVQgKDIpOiBZZXMKCk9mZnNldAlOYW1lCQlTaXplCQlEZXNjcmlwdGlvbgoweDEwCWZpcm13
YXJlX2RhdGEJMCB0byAweDFmMAlGaXJtd2FyZSBkYXRhCgo9PT0gR2V0IGZpcm13YXJlIHN0
YXR1cyAoMHg4KSA9PT0KCkxlbmd0aDogMHgxNApTdXBwb3J0ZWQgb3BlcmF0aW9uczoKCUdF
VCAoMSk6IFllcwoJU0VUICgyKTogVW5saWtlbHkKCk9mZnNldAlOYW1lCQlTaXplCURlc2Ny
aXB0aW9uCjB4MTAJZmlybXdhcmVfc3RhdHVzCTQJRmlybXdhcmUgc3RhdHVzLCBJIGd1ZXNz
Cgo9PT0gR2V0IHByb2ZpbGUgKDB4YSkgPT09CgpMZW5ndGg6IDB4MTAsIDB4MTQKU3VwcG9y
dGVkIG9wZXJhdGlvbnM6CglHRVQgKDEpOiBZZXMKCVNFVCAoMik6ID8KClJlcXVlc3QgKDB4
MTAgYnl0ZXMpOgpPZmZzZXQJTmFtZQkJU2l6ZQlEZXNjcmlwdGlvbgoKUmVzcG9uc2UgKDB4
MTQgYnl0ZXMpOgpPZmZzZXQJTmFtZQkJU2l6ZQlEZXNjcmlwdGlvbgoweDEwCXByb2ZpbGUJ
CTB4NAlEZXZpY2UgcHJvZmlsZSAoZmVhdHVyZXMsIGV0Yy4uLikKCUJJVCgxKQk/CglCSVQo
MCkJPwoKPT09IEdldC9TZXQgYnJpZ2h0bmVzcyAoMHgxMDEpID09PQoKTGVuZ3RoOiAweDE4
ClN1cHBvcnRlZCBvcGVyYXRpb25zOgoJR0VUICgxKTogWWVzCglTRVQgKDIpOiBZZXMKCk9m
ZnNldAlOYW1lCQlTaXplCURlc2NyaXB0aW9uCjB4MTAJdW5rCQk0CTAKMHgxNAlicmlnaHRu
ZXNzCTQJQnJpZ2h0bmVzcyB2YWx1ZSAoMC0xMDApCgo9PT0gR2V0L1NldCBjb250cmFzdCAo
MHgxMDIpID09PQoKTGVuZ3RoOiAweDE4ClN1cHBvcnRlZCBvcGVyYXRpb25zOgoJR0VUICgx
KTogWWVzCglTRVQgKDIpOiBZZXMKCk9mZnNldAlOYW1lCQlTaXplCURlc2NyaXB0aW9uCjB4
MTAJdW5rCQk0CTAKMHgxNAljb250cmFzdAk0CUNvbnRyYXN0IHZhbHVlICgwLTEwMCkKCj09
PSBHZXQvU2V0IGh1ZSAoMHgxMDMpID09PQoKTGVuZ3RoOiAweDE4ClN1cHBvcnRlZCBvcGVy
YXRpb25zOgoJR0VUICgxKTogWWVzCglTRVQgKDIpOiBZZXMKCk9mZnNldAlOYW1lCQlTaXpl
CURlc2NyaXB0aW9uCjB4MTAJdW5rCQk0CTAKMHgxNAlodWUJCTQJSHVlIHZhbHVlICgwLTEw
MCkKCj09PSBHZXQvU2V0IHNhdHVyYXRpb24gKDB4MTA0KSA9PT0KCkxlbmd0aDogMHgxOApT
dXBwb3J0ZWQgb3BlcmF0aW9uczoKCUdFVCAoMSk6IFllcwoJU0VUICgyKTogWWVzCgpPZmZz
ZXQJTmFtZQkJU2l6ZQlEZXNjcmlwdGlvbgoweDEwCXVuawkJNAkwCjB4MTQJaHVlCQk0CVNh
dHVyYXRpb24gdmFsdWUgKDAtMTAwKQoKPT09ID8gKDB4MjAwKSA9PT0KCkxlbmd0aDogMHgx
NApTdXBwb3J0ZWQgb3BlcmF0aW9uczoKCUdFVCAoMSk6ID8KCVNFVCAoMik6IFllcwoKT2Zm
c2V0CU5hbWUJCVNpemUJRGVzY3JpcHRpb24KCj09PSBHZXQgdmlkZW8gY29tcHJlc3Npb24g
aW5mbyAoMHgyMDEpID09PQoKTGVuZ3RoOiAweDFjClN1cHBvcnRlZCBvcGVyYXRpb25zOgoJ
R0VUICgxKTogWWVzCglTRVQgKDIpOiBVbmtub3duCgpPZmZzZXQJTmFtZQkJU2l6ZQlEZXNj
cmlwdGlvbgoweDAJdW5rCQk0CVN0cmVhbSBpbmRleD8KMHg0CWtleV9mcmFtZXJhdGUJNAlE
ZWZhdWx0S2V5RnJhbWVSYXRlIChEZWZhdWx0UEZyYW1lUmF0ZSBpcyBEZWZhdWx0S2V5RnJh
bWVSYXRlIC0gMSkKMHg4CXF1YWxpdHkJCTQJRGVmYXVsdFF1YWxpdHkKCj09PSBHZXQgdmlk
ZW8gY29tcHJlc3Npb24ga2V5ZnJhbWUgcmF0ZSAoMHgyMDIpID09PQoKTGVuZ3RoOiAweDE4
ClN1cHBvcnRlZCBvcGVyYXRpb25zOgoJR0VUICgxKTogWWVzCglTRVQgKDIpOiBZZXMKCk9m
ZnNldAlOYW1lCQlTaXplCURlc2NyaXB0aW9uCjB4MAlzdHJlYW1faWR4CTQJU3RyZWFtIGlu
ZGV4CjB4NAlrZXlmcmFtZV9yYXRlCTQJS2V5ZnJhbWUgcmF0ZQoKPT09IEdldCB2aWRlbyBj
b21wcmVzc2lvbiBxdWFsaXR5ICgweDIwMykgPT09CgpMZW5ndGg6IDB4MTgKU3VwcG9ydGVk
IG9wZXJhdGlvbnM6CglHRVQgKDEpOiBZZXMKCVNFVCAoMik6IFllcwoKT2Zmc2V0CU5hbWUJ
CVNpemUJRGVzY3JpcHRpb24KMHgwCXN0cmVhbV9pZHgJNAlTdHJlYW0gaW5kZXgKMHg0CXF1
YWxpdHkJCTQJUXVhbGl0eSB2YWx1ZSBmcm9tIDAgKHdvcnN0KSB0byAxMDAwMCAoYmVzdCkK
Cj09PSA/ICgweDJmMCkgPT09CgpMZW5ndGg6IDB4OWUKU3VwcG9ydGVkIG9wZXJhdGlvbnM6
CglHRVQgKDEpOiBZZXMKCVNFVCAoMik6ID8KCk9mZnNldAlOYW1lCQlTaXplCURlc2NyaXB0
aW9uCgo9PT0gR2V0L1NldCBQQyBncmFiYmVyICgweGUwMDEpID09PQoKTGVuZ3RoOiAweDFj
LDB4NGMsMHgyMDAKU3VwcG9ydGVkIG9wZXJhdGlvbnM6CglHRVQgKDEpOiBZZXMKCVNFVCAo
Mik6IFllcwoKT2Zmc2V0CU5hbWUJCVNpemUJRGVzY3JpcHRpb24KCj09PSBHZXQgdGltZXN0
YW1wPyAoMHhmMDAxKSA9PT0KCkdldCBlbGFwc2VkIG1pbGxpc2Vjb25kcyBzaW5jZSBsYXN0
IGdldCB0aW1lc3RhbXAgcmVxdWVzdC4KCkxlbmd0aDogMHgxNApTdXBwb3J0ZWQgb3BlcmF0
aW9uczoKCUdFVCAoMSk6IFllcwoJU0VUICgyKTogPwoKT2Zmc2V0CU5hbWUJCVNpemUJRGVz
Y3JpcHRpb24KMHgwMAltaWxsaXMJCTQJTnVtYmVyIG9mIGVsYXBzZWQgbWlsbGlzZWNvbmRz
IHNpbmNlIGxhc3QgY2FsbAoK

--------------skNra0DffOPh6XpKdwe4fASd--
