Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D717E1FF950
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 18:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729265AbgFRQdl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 12:33:41 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:36147 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728523AbgFRQdk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 12:33:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id lxTqj4kzMOn2BlxTtjr68t; Thu, 18 Jun 2020 18:33:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592498017; bh=vtKr0QJM4YQXYVakz3PAt/mbhJX5PkE3qB6K3H3yOvU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=J9LyKS1thEawyu9GhMKQvu6sYFHjlbrKeBdhchSUfggNrEZ6bowPpzF+1ez1nwKFJ
         qblPDJf0slg3FgDlT39zDGvichFGqDRNNi39VyT8yvRbVlKPCiuIov0VCeuXESQhCF
         R1q5COrVDw9So6pnifER8eRXgywxh1yyTunOGmT/TjW6rYI+fbwbGbpK93Q47LPe+f
         cMkFjHZ6vk6pqyzE8LmESzejpxEHNQ5geg6ZZFQnUZ7Dvysr9KqPmlUOef5V9gRMmW
         yRFuXGQLb3A0f4VxLHTYLebc8nm0f4I0hm4MkhOqRrouKacQqgzk+nldKS+vjPzfNU
         xTRxTO7zU4M2Q==
Subject: Re: [PATCH v5 2/2] media: cec: i2c: ch7322: Add ch7322 CEC controller
 driver
To:     Jeff Chase <jnchase@google.com>
Cc:     linux-media@vger.kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
References: <20200615193811.233737-1-jnchase@google.com>
 <20200615193811.233737-3-jnchase@google.com>
 <3aefc5c4-2af1-59f2-0797-9a5baf91482e@xs4all.nl>
 <CALTkaQ3n30nS-b1XuMiu_Z4+FfD0horJDagCPBaUqCCx4JhtdA@mail.gmail.com>
 <e45bf5a1-3862-66a2-213b-f7e5563e5a5d@xs4all.nl>
 <CALTkaQ02_ttD52h=74hGos09a0ihQwv-rQS5vwpDsrdnK_rYrg@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <72ea0f61-5fd4-47b6-4b0f-db620ee661db@xs4all.nl>
Date:   Thu, 18 Jun 2020 18:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALTkaQ02_ttD52h=74hGos09a0ihQwv-rQS5vwpDsrdnK_rYrg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEg9Fnp5dNVyyXieynelS/dpB4wvcDOi8fTMtjfdMvpYuOB89rpIizCnaS5UL6XXQTwlvKK4gwXHgHi4AP28TCQOvgjYigwr5+WnGX1VWEn2O+r8tD9W
 LOiv81vX0EJLHWoz0umvCou11cQnsuk4vwiBVjWD1UKkLRv1MOb17+zeBb/HvnGWDkqNLYX9Ln7/+zFLO1bmk2Ym4Rec1BMbn5+5GRkN7A+retpt4gXMEzNN
 EW66c9A0I9G6bMi/PA9Hit4ZMWaaaERbxHaKL9wKEMk31+5lxITmKU8C7R+cqm2iNqYBW2Kgkw6hP9ktFgxyCA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/06/2020 18:25, Jeff Chase wrote:
> On Thu, Jun 18, 2020 at 3:05 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>
>> On 18/06/2020 10:59, Jeff Chase wrote:
>>> Hi Hans,
>>>
>>> We are using two of these in an Intel-based Chromebox. I see that the
>>> cros-ec and seco drivers just statically define the PCI BDF of the
>>> Intel graphics device for their boards. I don't see an example of ACPI
>>> passing this information. I can copy cros-ec and seco by adding a
>>> board table and then use the UID of each device to select the correct
>>> port. Adding board-specific configuration to the driver doesn't seem
>>> ideal but I'm not sure what the proper way to pass this using ACPI is.
>>
>> You are right, it's not ACPI, it's using DMI matching.
>>
>> I have zero knowledge about ACPI, so I have no idea if there is some standard
>> method of retrieving this association via ACPI.
> 
> I'm not very familiar with ACPI either. I looked for but did not find
> an ACPI equivalent of_get_mac_address().
> 
> I believe it's possible to reference the PCI node but it would take a
> bit of work on both the coreboot and linux side.
> 
>>
>> This particular chip can actually be used both with DMI matching but also
>> on an ARM with device tree, but since you can't test this on an ARM board,
>> there is no point in adding support for that.
>>
>> However, compared to the cros-ec and seco drivers you can do something a bit
>> different here: those drivers just return -ENODEV if there is no match, but
>> since this driver reads the EDID it can just continue as long as it does not
>> set the CEC_CAP_CONNECTOR_INFO capability.
> 
> Is it necessary to add support if we don't set CEC_CAP_CONNECTOR_INFO?

It is very desirable. Otherwise userspace will not know which CEC device is associated
with which HDMI device. Since you are using two of these chips for a Chromebox, I
suspect that you actually need to support this.

Also, I am (slowly) working on wiring support for this in all CEC transmitter drivers,
so I prefer not to add CEC drivers without support for this.

I really should have noticed much earlier that support for this was missing. My
apologies for that.

Regards,

	Hans
