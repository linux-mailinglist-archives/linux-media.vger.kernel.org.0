Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93CB1628B0F
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 22:09:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237674AbiKNVJD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Nov 2022 16:09:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237543AbiKNVIs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Nov 2022 16:08:48 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DFD140D3
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 13:08:43 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id s10so9198359ioa.5
        for <linux-media@vger.kernel.org>; Mon, 14 Nov 2022 13:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7w2BwecuP10eoRiF0s2tu2fH3T8pUbcm8v8VfHkjwQ0=;
        b=iisayqaaLjlJqRw/iaSaygLpAGKMAriixdeBRH/eheiKZ4H+2bqqacpTYWOOcEpfo3
         uTZxirx+d+8ZzYbVV/eJOzwoWj+uQpkExHc1mrejsn4UJXxYXgA2LyKVYQXYen/6hIj4
         ClI2OZB2JvNphpTi0dPiahR9MiCV81YWTZ1nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7w2BwecuP10eoRiF0s2tu2fH3T8pUbcm8v8VfHkjwQ0=;
        b=kessVtmhcdATbJFceovzjOdfDo0M8xUzv0PEwZuTVVo+6W/ow8RVh8u0EGZ65eWUbR
         yqHpSwL+N2gZ3il9SXa91OGU5eHBDljpO1b8zi+s64qDEUCzK+yo1ECvRqOIP655Ccbz
         AuJ089rbks4Ur23lHWaw+L3e5ZmxIAwT+DCY6v5JrQvuGSTDCtK30Wt9algZPoc/D7p0
         CneD0PStdnu1fo6yozVZ4j8IJyFhpx5vwyBv63zRsQKwwQq6sTRc9KH/Y+YTNF9hja+3
         zkaa4b0grhiyiyh4mIJ7o0oh14tR1bDeFaQPWBXy+dXHGNM16EFP9VL7paqFaFchkZSq
         YPWQ==
X-Gm-Message-State: ANoB5plTiQwt040QFRPjJkNtcNvDgaaHAAkLf3/UXHxKtUXF9sva2R+l
        ECvt3aMbSgnoKmi2e9c+iy9jnQ==
X-Google-Smtp-Source: AA0mqf6gRWcibFN23DSGTRlJqaOwzs7g8rxQ7fCqoBhjZLO0U7Efm4j/YhV3WgEp72b/W3J/O6+b2w==
X-Received: by 2002:a05:6638:1912:b0:375:4a9b:181a with SMTP id p18-20020a056638191200b003754a9b181amr6496957jal.233.1668460122982;
        Mon, 14 Nov 2022 13:08:42 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id h1-20020a022b01000000b003734c4d01d2sm3873013jaa.61.2022.11.14.13.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 13:08:42 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------mrTfNph7za02S1U40kwMp0sv"
Message-ID: <31b33241-291e-6694-1a81-636b13aa630d@linuxfoundation.org>
Date:   Mon, 14 Nov 2022 14:08:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-media@vger.kernel.org
From:   Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] Linux Media vimc fixes update for 6.1-rc6
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------mrTfNph7za02S1U40kwMp0sv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mauro,

Please pull the following vimc fixes update for Linux 6.1-rc6.

This vimc fixes update for Linux Media 6.1-rc6 consists of a critical fix
in vimc_init error path.

diff is attached.

Please note that this patch a candidate for stables: applies to 6.0, 5.15,
and 5.10 as is. Since vimc moved it needs port for 5.4 and 4.19.

I will send patches for 5.4 and 4.19 stables once this patch get into the
mainline.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit ca6976420bf11cb2c11702d824692c3b7d301b37:

   media: vimc: Update device configuration in the documentation (2022-10-18 16:24:53 -0600)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux tags/linux-vimc-6.1-rc6

for you to fetch changes up to 4585c540ad1358389e11240dc8d6cd9343f71e0a:

   media: vimc: Fix wrong function called when vimc_init() fails (2022-11-10 09:52:53 -0700)

----------------------------------------------------------------
linux-vimc-6.1-rc6

This vimc fixes update for Linux Media 6.1-rc6 consists of a critical fix
in vimc_init error path.

----------------------------------------------------------------
Chen Zhongjin (1):
       media: vimc: Fix wrong function called when vimc_init() fails

  drivers/media/test-drivers/vimc/vimc-core.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
----------------------------------------------------------------
--------------mrTfNph7za02S1U40kwMp0sv
Content-Type: text/x-patch; charset=UTF-8; name="linux-vimc-6.1-rc6.diff"
Content-Disposition: attachment; filename="linux-vimc-6.1-rc6.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdGVzdC1kcml2ZXJzL3ZpbWMvdmltYy1jb3Jl
LmMgYi9kcml2ZXJzL21lZGlhL3Rlc3QtZHJpdmVycy92aW1jL3ZpbWMtY29yZS5jCmluZGV4
IDJhZTdhMGYxMWViZi4uZTgyY2ZhNWZmYmY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlh
L3Rlc3QtZHJpdmVycy92aW1jL3ZpbWMtY29yZS5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdGVz
dC1kcml2ZXJzL3ZpbWMvdmltYy1jb3JlLmMKQEAgLTQzMyw3ICs0MzMsNyBAQCBzdGF0aWMg
aW50IF9faW5pdCB2aW1jX2luaXQodm9pZCkKIAlpZiAocmV0KSB7CiAJCWRldl9lcnIoJnZp
bWNfcGRldi5kZXYsCiAJCQkicGxhdGZvcm0gZHJpdmVyIHJlZ2lzdHJhdGlvbiBmYWlsZWQg
KGVycj0lZClcbiIsIHJldCk7Ci0JCXBsYXRmb3JtX2RyaXZlcl91bnJlZ2lzdGVyKCZ2aW1j
X3BkcnYpOworCQlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3RlcigmdmltY19wZGV2KTsKIAkJ
cmV0dXJuIHJldDsKIAl9CiAK

--------------mrTfNph7za02S1U40kwMp0sv--
