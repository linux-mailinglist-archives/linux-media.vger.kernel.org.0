Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C13F64C700
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 11:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237666AbiLNKXa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 05:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237450AbiLNKX3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 05:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190EC614E
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 02:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671013363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=oZg5ofo237mNt8jPqIOFvrjJ9UGaIyH2k2lFEM+AU7I=;
        b=OFMTrLbVowogQa+A0nCiPmu9LS/9f+MQKikevNuL8OkojePmL3wqRuMrWFXfJozylJUmpm
        YFIld0z3dm3Ghww0FLyGoviFnJKSvjYDOur+qk8TEdMzVN83ws3rFW/RY+l9eutqAnGciK
        /YlATAeNI0dOntOrscB6X+Xdvn4gX50=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-61-2Da4tUDBNa2AESAd4V3JGA-1; Wed, 14 Dec 2022 05:22:42 -0500
X-MC-Unique: 2Da4tUDBNa2AESAd4V3JGA-1
Received: by mail-wm1-f70.google.com with SMTP id bi19-20020a05600c3d9300b003cf9d6c4016so505992wmb.8
        for <linux-media@vger.kernel.org>; Wed, 14 Dec 2022 02:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:organization:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oZg5ofo237mNt8jPqIOFvrjJ9UGaIyH2k2lFEM+AU7I=;
        b=4eZp9jBQtN8uHofKz5bIaLm1qQHMyhXpEf8h/ZD6RDGXP8xO5u+FQAmIGmSQr0WyFE
         fxRsroYlLiWhN4xYiVj8sHtIIzHWUifboGiOhaHRH14ISFl30i++zWxqcbHEo9TpCAr1
         gGm1DQDqe03pOdXQbxk2cJbC5pl+liBXiahAbZmOCxTC5PjvVNH47G7onvm0fgLO8CA8
         HALhhTgZ62d1oZ9NwjOGpDxuriIJfX52LrhMyl6KAcxPU/nh4NbBiOgUUIVtuTnFt94p
         7KeI5Sk52XSda2hni3zXZpaLCr8pge2Yz4KhhhEMOGOg+9gBy6k/jYUYmUowBpankmKX
         QRTg==
X-Gm-Message-State: ANoB5pkX+N+DVrepZZAYUAG9libHeDiiljlPP8j45El7Y3pSLIRedcjv
        qOz4ZN+Uk69eRg2M+9RoA9O0MjQZPZKuTejk530MG8iPQKDKqylUW5gSkSbeVVVn+ZdeXE4sMkT
        iaYHCzQahMPvf1RB3RdaanCQ=
X-Received: by 2002:a5d:490d:0:b0:242:fa5:ce83 with SMTP id x13-20020a5d490d000000b002420fa5ce83mr17530650wrq.37.1671013361351;
        Wed, 14 Dec 2022 02:22:41 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6eqNaTD3L0zpw19VpnMEoi1p3BYCcKA3C58XAoVlwb8be+bNLsFo0uG8nChzy/fA/DaBgKOw==
X-Received: by 2002:a5d:490d:0:b0:242:fa5:ce83 with SMTP id x13-20020a5d490d000000b002420fa5ce83mr17530636wrq.37.1671013361043;
        Wed, 14 Dec 2022 02:22:41 -0800 (PST)
Received: from [192.168.3.108] (p5b0c668c.dip0.t-ipconnect.de. [91.12.102.140])
        by smtp.gmail.com with ESMTPSA id o26-20020a5d58da000000b002420dba6447sm2442291wrf.59.2022.12.14.02.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 02:22:40 -0800 (PST)
Message-ID: <fbefc16e-84d3-8afc-8c8e-4229bded0c8a@redhat.com>
Date:   Wed, 14 Dec 2022 11:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "linux-mm@kvack.org" <linux-mm@kvack.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Dubious usage of VM_SHARED in atomisp_fops.c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

going over all VM_SHARED and VM_MAYSHARE user in the kernel, I stumbled 
over the following dubious code in 
drivers/staging/media/atomisp/pci/atomisp_fops.c:


if (!(vma->vm_flags & (VM_WRITE | VM_READ)))
	return -EACCES;

...

if (!(vma->vm_flags & VM_SHARED)) {
	/* Map private buffer.
	 * Set VM_SHARED to the flags since we need
	 * to map the buffer page by page.
	 * Without VM_SHARED, remap_pfn_range() treats
	 * this kind of mapping as invalid.
	 */
	vma->vm_flags |= VM_SHARED;
	ret = hmm_mmap(vma, vma->vm_pgoff << PAGE_SHIFT);
	...
}


We're converting a writable MAP_PRIVATE mapping ("COW mapping") into a 
writable MAP_SHARED mapping, to hack around the is_cow_mapping() check 
in remap_pfn_range_notrack().

We're not even setting VM_MAYSHARE and turn the mapping silently into 
something with completely different semantics.


That code has to go.


One approach would be to reject such mappings (no idea if user space 
relies on private mappings), the other one would be to remove this 
driver. Judging that the driver already was marked broken in 2020 
(ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")), 
maybe it's time for the driver to go.

Thoughts?

-- 
Thanks,

David / dhildenb

