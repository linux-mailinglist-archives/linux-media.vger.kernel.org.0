Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 399BC60B58D
	for <lists+linux-media@lfdr.de>; Mon, 24 Oct 2022 20:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbiJXSb6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Oct 2022 14:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbiJXSbb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Oct 2022 14:31:31 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE4937428
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 10:12:47 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id o65so8263913iof.4
        for <linux-media@vger.kernel.org>; Mon, 24 Oct 2022 10:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yo8X3kdODOGqSn+K8PMBYliTU4w3mUxBAvbY1N92N7k=;
        b=LqlPzZD9w3QkySfcqXSJwnUWpTzQOnvFHIAVqMKwz3KDzZWp4g0WVEHzYa5MY7mqic
         7o9NNqtTtqOcRgDXmlEAGtiPnKG7+hZu0OclgThX2gj0FBulqcwgNocYPOTfPwQqEy3V
         2aJmx3A8X2F0LgKBPDfJgsZpV5YBSZBiAJV1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yo8X3kdODOGqSn+K8PMBYliTU4w3mUxBAvbY1N92N7k=;
        b=D7Ai9Bzyfd18oHW57BUBjvjWOTnCETs7I8vBgI89U9S1GhJIk05b+hGy5BB+oXinK4
         7XAsjJPBWgBaXQw9LAESv9XwuXH05OMJGPb2kEbXAY2WpGz4/GKq3kknoXYXnvPPnGst
         Srd1gJ8N83LaSV3IWULwzbPcFDBnPPXmvByn6TDragTXUPFsMTWPs3P1psP8Zw46+RnS
         4HSCquAGiK869maSEUqhGaoK3r0Zl3kD/7TQZSWiUiFg8KDHpiM+ZlmGGzUJ38444jLo
         bAUW791VosAFhmlFgHXpuRWlerfQpYqj9AKAePmA5AsYR/llA61kGYVke+pmViKr7jQE
         ejTQ==
X-Gm-Message-State: ACrzQf0kxl8w5rBGZ883Q5LZui/2J/ZmEwDJJR0fuqsrZ1vhFlB0esys
        Nds2rtjTneef/Nwhmh0rJ8hA/WFBP2wypw==
X-Google-Smtp-Source: AMsMyM4GbLO4WaCglULeD3D5wXfmuEPFheWGxEZcjPXVVppTmRiWHoSebySEZPZjOrFqZBqeRgMZ1w==
X-Received: by 2002:a05:6638:3391:b0:374:1739:3795 with SMTP id h17-20020a056638339100b0037417393795mr3486501jav.87.1666631494735;
        Mon, 24 Oct 2022 10:11:34 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id t2-20020a056e02010200b002ff7cd2691bsm166077ilm.20.2022.10.24.10.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 10:11:34 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------S0gGEUjZJ1lGVKI3JJ6Cqds9"
Message-ID: <e2a8df50-21bd-eb55-83dc-30703712338c@linuxfoundation.org>
Date:   Mon, 24 Oct 2022 11:11:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] Linux Media vimc fixes update for 6.1-rc4
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is a multi-part message in MIME format.
--------------S0gGEUjZJ1lGVKI3JJ6Cqds9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mauro,

Please pull the following vimc fixes update for 6.1-rc4.

This vimc fixes update for Linux Media 6.1-rc4 consists of a single
fix to documentation. Current configuration in the document is outdated
and doesn't work.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux tags/linux-vimc-6.1-rc4

for you to fetch changes up to ca6976420bf11cb2c11702d824692c3b7d301b37:

   media: vimc: Update device configuration in the documentation (2022-10-18 16:24:53 -0600)

----------------------------------------------------------------
linux-vimc-6.1-rc4

This vimc fixes update for Linux Media 6.1-rc4 consists of a single
fix to documentation. Current configuration in the document is outdated
and doesn't work.

----------------------------------------------------------------
Dafna Hirschfeld (1):
       media: vimc: Update device configuration in the documentation

  Documentation/admin-guide/media/vimc.rst | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)

----------------------------------------------------------------
--------------S0gGEUjZJ1lGVKI3JJ6Cqds9
Content-Type: text/x-patch; charset=UTF-8; name="linux-vimc-6.1-rc4.diff"
Content-Disposition: attachment; filename="linux-vimc-6.1-rc4.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbWVkaWEvdmltYy5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL21lZGlhL3ZpbWMucnN0CmluZGV4IDNiNGQy
YjM2YjRmMy4uMjlkODQzYThkZGIxIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL21lZGlhL3ZpbWMucnN0CisrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
bWVkaWEvdmltYy5yc3QKQEAgLTM1LDExICszNSwxMSBAQCBvZiBjb21tYW5kcyBmaXRzIGZv
ciB0aGUgZGVmYXVsdCB0b3BvbG9neToKIAogICAgICAgICBtZWRpYS1jdGwgLWQgcGxhdGZv
cm06dmltYyAtViAnIlNlbnNvciBBIjowW2ZtdDpTQkdHUjhfMVg4LzY0MHg0ODBdJwogICAg
ICAgICBtZWRpYS1jdGwgLWQgcGxhdGZvcm06dmltYyAtViAnIkRlYmF5ZXIgQSI6MFtmbXQ6
U0JHR1I4XzFYOC82NDB4NDgwXScKLSAgICAgICAgbWVkaWEtY3RsIC1kIHBsYXRmb3JtOnZp
bWMgLVYgJyJTZW5zb3IgQiI6MFtmbXQ6U0JHR1I4XzFYOC82NDB4NDgwXScKLSAgICAgICAg
bWVkaWEtY3RsIC1kIHBsYXRmb3JtOnZpbWMgLVYgJyJEZWJheWVyIEIiOjBbZm10OlNCR0dS
OF8xWDgvNjQweDQ4MF0nCi0gICAgICAgIHY0bDItY3RsIC16IHBsYXRmb3JtOnZpbWMgLWQg
IlJHQi9ZVVYgQ2FwdHVyZSIgLXYgd2lkdGg9MTkyMCxoZWlnaHQ9MTQ0MAorICAgICAgICBt
ZWRpYS1jdGwgLWQgcGxhdGZvcm06dmltYyAtViAnIlNjYWxlciI6MFtmbXQ6UkdCODg4XzFY
MjQvNjQweDQ4MF0nCisgICAgICAgIG1lZGlhLWN0bCAtZCBwbGF0Zm9ybTp2aW1jIC1WICci
U2NhbGVyIjowW2Nyb3A6KDEwMCw1MCkvNDAweDE1MF0nCisgICAgICAgIG1lZGlhLWN0bCAt
ZCBwbGF0Zm9ybTp2aW1jIC1WICciU2NhbGVyIjoxW2ZtdDpSR0I4ODhfMVgyNC8zMDB4NzAw
XScKKyAgICAgICAgdjRsMi1jdGwgLXogcGxhdGZvcm06dmltYyAtZCAiUkdCL1lVViBDYXB0
dXJlIiAtdiB3aWR0aD0zMDAsaGVpZ2h0PTcwMAogICAgICAgICB2NGwyLWN0bCAteiBwbGF0
Zm9ybTp2aW1jIC1kICJSYXcgQ2FwdHVyZSAwIiAtdiBwaXhlbGZvcm1hdD1CQTgxCi0gICAg
ICAgIHY0bDItY3RsIC16IHBsYXRmb3JtOnZpbWMgLWQgIlJhdyBDYXB0dXJlIDEiIC12IHBp
eGVsZm9ybWF0PUJBODEKIAogU3ViZGV2aWNlcwogLS0tLS0tLS0tLQo=

--------------S0gGEUjZJ1lGVKI3JJ6Cqds9--
