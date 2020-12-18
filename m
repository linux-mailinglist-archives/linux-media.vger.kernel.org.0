Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7302DE2DD
	for <lists+linux-media@lfdr.de>; Fri, 18 Dec 2020 13:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgLRMgq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Dec 2020 07:36:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbgLRMgp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Dec 2020 07:36:45 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6319BC0617A7;
        Fri, 18 Dec 2020 04:36:05 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id x4so1249694vsp.7;
        Fri, 18 Dec 2020 04:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V4eym8D9Kwm4oGYUbRmg3T1ChX8N/yXmIctNbMLW76M=;
        b=R+I09ZWT066II5lFmGplIEI+ez16dU6L0S95ZPZWV2oHo+mFtaeKnUWd64CFzeiayT
         GyA7UvGQUuLhmHBRtdMLtgYb6XhmPFCTWtC5OWQTHAdriyJmPcuu3uNuY0D9dflGsfhO
         ydXeCdmrpx9KJVVUFhLEbidlLyfn6qAMMKe50Ab5HJ2eAwpaNFISjEZW6oEBIHSIwKm1
         C0JAkUS4bxCjdQywy8OQS81G6j6ZHOAnHQhE2zMmMT+rw0HaWkaY4ZzdwiWWXzsm4c3e
         t/nx07ascP/AAwIirhbLuldNVydsDRRb2vU9Vhgztlqf+LF9v3309ATLtQb54A6EwyZD
         jQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V4eym8D9Kwm4oGYUbRmg3T1ChX8N/yXmIctNbMLW76M=;
        b=QLA6y6EDn1bJjDG+9rrcB0yWg9MAr7ppnlCoJ5Ag9cDc1Z1jvFnMnF6eO4A1qwPa9N
         EANdpS3w4UHShTGGM6pL/tgcBNuEzXsu23csBnz0bWXleehKtnI5ZcrKQW4dhDp/qvKU
         fqp86ngJizAKL/jB1xUIW/JB3jvvfi5QBk67M85bf0W+hFjh2MPUnYcFVdchUm/pOxPk
         1i43xgl8g/rkd19DdsNaTn2ieHp+ShdKJpkYCDMVxX1pMne/TJEZwnxUo6jp7bnFz2v7
         GEzd5p0U5UTbakDWlBVPjkhArPEk6nxN/jw/9QTHovDNYvLr2jFcE9mYiDH3ZiA6QXfP
         hgLw==
X-Gm-Message-State: AOAM532BW2W7+vMQwamj6B4t/cXq2tOwe0ndpU2v2A9BVFOf+09Jbo9o
        BLSdXE5CiqU/g/AwHir46lY=
X-Google-Smtp-Source: ABdhPJw9bqUkVZhYNUA8fk6gl5JHMRAZFTuPkjWNS9ICh5V7A+Ja7NvXLdzPbcW/cfW1TtS8NwYS1A==
X-Received: by 2002:a67:a85:: with SMTP id 127mr3181968vsk.16.1608294964477;
        Fri, 18 Dec 2020 04:36:04 -0800 (PST)
Received: from fedora ([179.48.249.132])
        by smtp.gmail.com with ESMTPSA id b16sm1276899vkp.2.2020.12.18.04.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 04:36:03 -0800 (PST)
Date:   Fri, 18 Dec 2020 07:35:58 -0500
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, gustavoars@kernel.org,
        linux-media@vger.kernel.org, trivial@kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: cec: fix trivial style warnings
Message-ID: <20201218123558.GA4088@fedora>
References: <20201218063117.GA80700@fedora>
 <20201218101630.GM2831@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201218101630.GM2831@kadam>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 18, 2020 at 01:16:30PM +0300, Dan Carpenter wrote:
> On Fri, Dec 18, 2020 at 01:31:17AM -0500, Nigel Christian wrote:
> > Comment has 'then' repeated twice. Let's clean it up.
> > Use unsigned int to maintain naming consistency.
> > 
> 
> Do you use a tool to find the double "then then"?
> 
> regards,
> dan carpenter
> 

Started working on nodejs script to run the 'checkpatch.pl -f'
on directories and filter the output by command line arg.
It goes in scripts/ and is run from the root of the kernel.
Let me know if there is any modification that can make it
more effective or specific filters.
------------------
'use strict'
// place this file in kernel 'scripts' directory
const pfs = require('fs').promises
const { spawn } = require('child_process')
const dir = process.argv[2]
const lvl = process.argv[3]
const path = `./${dir}`
const checkPatch = './scripts/checkpatch.pl -f'
const badInput = dir === undefined || dir === null || dir === ''
                || lvl === undefined || lvl === null || lvl === ''

/**
 * Check for valid command line arguments
 */
if(badInput) {
    console.log('Run checkpatch.pl on directories')
    console.log('Usage: node ./scripts/checkdirpatch <path/to/check>'
    + ' <LEVEL> (e.g. WARNING or ERROR)')
    process.exit(1)
} else {
    console.log(`Reading path ${path}...`)
}

/**
 * Async function for running checkpatch.pl on entire directory
 * We won't drill down any further from here and only check for
 * files at the current directory. Output is controlled via the 
 * log level which is passed as command line argument
 */
async function check() {
    const files = await pfs.readdir(path).then(v => v)
    files.forEach(async f => {
        const stat = await pfs.lstat(`${path}${f}`)
        if(stat.isFile()) {
            const child = spawn(`${checkPatch} ${path}${f} | grep -A1 ${lvl}`, {
                shell: true,
                stdio: ['pipe', 'inherit', 'ignore']
            })
        }
    })
}
check().catch(e => console.error(e))
--------------------------------------------

https://github.com/callmekurisu/kernel-dev/blob/main/checkdirpatch.js


Thanks, 

Nigel
