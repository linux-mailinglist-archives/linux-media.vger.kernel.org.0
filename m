Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E187930261B
	for <lists+linux-media@lfdr.de>; Mon, 25 Jan 2021 15:11:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729288AbhAYOLW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jan 2021 09:11:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729264AbhAYOJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jan 2021 09:09:40 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85E82C061574
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 06:08:59 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id i9so4631928wmq.1
        for <linux-media@vger.kernel.org>; Mon, 25 Jan 2021 06:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastree3d-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=qNl2yTrN3Gfh6se4KuYEc8vhpBdnlf09u1AfeL/1iCE=;
        b=0ZjUPnykgld9UT86qjmSAoCAGcyDYyFX71hR8wVXOCCtNnWrV1YkC0AuzyYYJ1QA7Q
         OX5Q9Yd2DukHPuivFbd4ZhtvoJ0PhseW5M3FSLkYmH3bky/QgRfHO8cz3V4KGw9scupT
         SqYCz1wrWAwg2b2pVeQ1iLeFZspEua18mrjwo4VEGnzvU9aY5Z0YnN6d5tMCOcvfuBUX
         0qQrkRvYqormlSI272xDEEK2U42Ievu7m3ihVFFuMx9MUg/yslJoUOw9v480mNrDN17A
         miYS68gQXl8NtSfL8MpQKsRIbP89QN9AiN2dSeJQSp5Wq7hXwDdcavBXgzOsXq8QB0Ma
         hntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=qNl2yTrN3Gfh6se4KuYEc8vhpBdnlf09u1AfeL/1iCE=;
        b=Ac8To9ch/uuH8n7iBa5ATIrZMdyvFXXT2zAOZ/QnC/CWRZlss2RmQsv+0yz59ZOV8u
         5jwJ6khqV0gQMDhIjHtrXHUQOz4mQDL9voHg++fj4dU5rmTfC5AvViZGov5pvWLbKxmp
         AyiJkV0rd0zluRLsQAnaREkxgvpzoe1xPNTgxQ+ktvZI1DQ5B7b6FCMYNxKntDtCZvpE
         v10Z0pWaYYZB4dmdZVs/gqxgoOVukmpbzCKJCHrTKdv+KMhzbtyDRfciZV+ypPfTOFee
         0hJPsMlgGNnZSXq/VEzlOtomy4A8eHUWUNq1qMKQMccnW6ml/WhDHtz+sGiUHeNi6PP0
         TpTQ==
X-Gm-Message-State: AOAM53131HP10j/GZiH49CvYmOq6vR/Qx9hrhul2p+M6uFSwQyiXc3kC
        D58xIPJPX33BY/eVS0TwInHV
X-Google-Smtp-Source: ABdhPJz0zSgwROWOGaj6e656jH5AipxmiirDT3KM+AekFIuj6Zxqn0rXdG571OyVEzI6ZNMLJxgdBQ==
X-Received: by 2002:a1c:2341:: with SMTP id j62mr344468wmj.34.1611583738320;
        Mon, 25 Jan 2021 06:08:58 -0800 (PST)
Received: from [192.168.2.144] (217.235.197.178.dynamic.wless.lssmb00p-cgnat.res.cust.swisscom.ch. [178.197.235.217])
        by smtp.gmail.com with ESMTPSA id y6sm21302382wma.19.2021.01.25.06.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 06:08:57 -0800 (PST)
From:   Adrian Fiergolski <adrian.fiergolski@fastree3d.com>
X-Google-Original-From: Adrian Fiergolski <Adrian.Fiergolski@fastree3d.com>
To:     niklas.soderlund+renesas@ragnatech.se
Cc:     laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        linux-media@vger.kernel.org, vishal.sagar@xilinx.com
Subject: v4l: status of 'add support for multiplexed streams' patch
Message-ID: <ad1f038f-f067-89f6-9dc6-4b423d719fc5@fastree3d.com>
Date:   Mon, 25 Jan 2021 15:08:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Niklas,

Thank you for your 'v4l: add support for multiplexed streams' patch [1].

What is the status of merging your development with v4l-utils? Version
1.16.5 doesn't provide --get/set-routing options. Also in the master of
v4l-utils I haven't found your code.

What is the current way of changing routing the video switches (e.g.
xilinx-axis-swtich which is not yet in the mainstream kernel)?

[1] https://lwn.net/Articles/782479/

