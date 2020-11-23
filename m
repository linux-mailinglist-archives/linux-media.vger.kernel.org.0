Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CA02C1181
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 18:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390234AbgKWRGR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 12:06:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52146 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387403AbgKWRGN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 12:06:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606151171;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ETdBmUCF01QVQJOZ+sQu9TUGQeVKu9xOEmE1E5gBvfU=;
        b=BtEofZ03By1sp6OyH8lSI6IT4Bb/Q48OsWV2XnBXmdgQcceGh9rKSaQV86czSHO4W4CJHn
        vUaUaH4n0l1WmtKl1NY4JjZQEtZdHR6F0okj/kLdyZp+LnqjvTzaYPmjipu9+IS6RcbTNg
        lanzsvwsZXvmVS2IMlU/0SstZMlkjqs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-6s8iFJTyNyu76x6naFdAuQ-1; Mon, 23 Nov 2020 12:06:09 -0500
X-MC-Unique: 6s8iFJTyNyu76x6naFdAuQ-1
Received: by mail-qt1-f199.google.com with SMTP id i20so14150388qtr.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 09:06:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ETdBmUCF01QVQJOZ+sQu9TUGQeVKu9xOEmE1E5gBvfU=;
        b=r4X+RchihkeZJRRNPf7/40PQbijbt9N2Mz7dTV+VrJ/IWIhF2wmjz5/h9EKM/UZu5o
         cKLk7ZWZq2jfHJog7idFFceiNUBr8wsK9Ar/6yXe4aJXhJDEdrIopl8BkG5IslztaTOp
         bJvBO4eKKNlW5a9qTa5hNlcraDiJv40t4wvuutsdE07zb2LxYCohKJqPQeg+xrbIFN/G
         c28OpSn/lnbMGE793MsTytDmssZbva+kvcyQRrf/comzy5+DzbavYeRj63sfQ7Mq9B/n
         fkg9z55c6mpVzYeCrCeCEfn8/qt+FYpbKQ9FGZBHZrZ5JXpEHg+eFiaVWeXWkgicplCH
         EEWQ==
X-Gm-Message-State: AOAM5301+/8jM12pJtVstTnk5TTN2AycijPrU0hUCN3zQZSXdG5qOX3T
        iV4aMBjskzPDDPfWy3NpZv/56cQQkjvRFQkBp/cZsG9YKXv6H/x6DXuZeqoELFdtcmsHDv/RU9G
        chp5ayBSGMcQh3zvKTslJ9bc=
X-Received: by 2002:ac8:5d53:: with SMTP id g19mr70886qtx.354.1606151168821;
        Mon, 23 Nov 2020 09:06:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHR8oVpP3xv7xpCkK6lH4mawBfXgRI3GL2dEiLGp13/vfLrDKV7SBtsWnvpv2iFDtHltekRw==
X-Received: by 2002:ac8:5d53:: with SMTP id g19mr70839qtx.354.1606151168572;
        Mon, 23 Nov 2020 09:06:08 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id o187sm10226153qkb.120.2020.11.23.09.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 09:06:07 -0800 (PST)
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To:     Joe Perches <joe@perches.com>, clang-built-linux@googlegroups.com
Cc:     linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, tboot-devel@lists.sourceforge.net,
        kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@acpica.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
        linux-scsi@vger.kernel.org, linux-wireless@vger.kernel.org,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        cluster-devel@redhat.com, linux-mtd@lists.infradead.org,
        keyrings@vger.kernel.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, alsa-devel@alsa-project.org,
        bpf@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-nfs@vger.kernel.org, patches@opensource.cirrus.com
References: <20201121165058.1644182-1-trix@redhat.com>
 <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
 <6e8c1926-4209-8f10-d0f9-72c875a85a88@redhat.com>
 <859bae8ddae3238116824192f6ddf1c91a381913.camel@perches.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <88eeba27-ee36-df63-8cd9-3cccbe5e0850@redhat.com>
Date:   Mon, 23 Nov 2020 09:06:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <859bae8ddae3238116824192f6ddf1c91a381913.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 11/22/20 10:22 AM, Joe Perches wrote:
> On Sun, 2020-11-22 at 08:33 -0800, Tom Rix wrote:
>> On 11/21/20 9:10 AM, Joe Perches wrote:
>>> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
>>>> A difficult part of automating commits is composing the subsystem
>>>> preamble in the commit log.  For the ongoing effort of a fixer producing
>>>> one or two fixes a release the use of 'treewide:' does not seem appropriate.
>>>>
>>>> It would be better if the normal prefix was used.  Unfortunately normal is
>>>> not consistent across the tree.
>>>>
>>>> So I am looking for comments for adding a new tag to the MAINTAINERS file
>>>>
>>>> 	D: Commit subsystem prefix
>>>>
>>>> ex/ for FPGA DFL DRIVERS
>>>>
>>>> 	D: fpga: dfl:
>>> I'm all for it.  Good luck with the effort.  It's not completely trivial.
>>>
>>> From a decade ago:
>>>
>>> https://lore.kernel.org/lkml/1289919077.28741.50.camel@Joe-Laptop/
>>>
>>> (and that thread started with extra semicolon patches too)
>> Reading the history, how about this.
>>
>> get_maintainer.pl outputs a single prefix, if multiple files have the
>> same prefix it works, if they don't its an error.
>>
>> Another script 'commit_one_file.sh' does the call to get_mainainter.pl
>> to get the prefix and be called by run-clang-tools.py to get the fixer
>> specific message.
> It's not whether the script used is get_maintainer or any other script,
> the question is really if the MAINTAINERS file is the appropriate place
> to store per-subsystem patch specific prefixes.
>
> It is.
>
> Then the question should be how are the forms described and what is the
> inheritance priority.  My preference would be to have a default of
> inherit the parent base and add basename(subsystem dirname).
>
> Commit history seems to have standardized on using colons as the separator
> between the commit prefix and the subject.
>
> A good mechanism to explore how various subsystems have uses prefixes in
> the past might be something like:
>
> $ git log --no-merges --pretty='%s' -<commit_count> <subsystem_path> | \
>   perl -n -e 'print substr($_, 0, rindex($_, ":") + 1) . "\n";' | \
>   sort | uniq -c | sort -rn

Thanks, I have shamelessly stolen this line and limited the commits to the maintainer.

I will post something once the generation of the prefixes is done.

Tom

