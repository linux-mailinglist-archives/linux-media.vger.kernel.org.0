Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 898EB30687E
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 01:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhA1AQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 19:16:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbhA1APk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 19:15:40 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94057C061573
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 16:15:00 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id b21so4599492edy.6
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 16:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=GVx6lF7CFjeLmq31fXlpDs513FQlOecqw6tErMi57BI=;
        b=KcFd5T4DSH1rkBCeA6C7Fq/UN59nbBt0km1Y7xilfwu+M9K6Z/pnSBRmz8xOE8bgYX
         ESUhB/H4GJFLpQeeLqRmX+ZvtuiRsIr1y6OE509EHwsOax5zOdkaCp+glbROfvQgnbCy
         s3yihYG+bgvtC/CIoM8qqddCzK3h2uYZYaBC4YfjBDk9jRc7IjUxusKkkwWjT+NJfVIR
         zqnWtGr3L/MViozdYctywf3abRSJOMYZpPRnMT0Kt8Lor5NtqufOG2e68RwcwQzxTOTQ
         pdqCn2xiA6ur5iiCYhVELNY4jk5O6rcB/jRnZTZYm3yIVflB87RF+MgqpChZsre1HzwP
         5qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=GVx6lF7CFjeLmq31fXlpDs513FQlOecqw6tErMi57BI=;
        b=cz3+VWg2ohdnEZIxZDR+pq+GfpB0stIEIGEdbzTWdW8NrDLjakl5nDT1h2p3XlRtfO
         T8VUwAaPfn5fS+G8if4VJHIvXTpjcnc0b4S/K4dR+/rFhGiFRqYxleBcPEju6Fh+Ohxf
         KxmRFn4liyOPM92xGdAfpcwfcF/h8nkfK/6ekuSDokGWvC/2q57d49YEv/+0HqNLz2In
         OQj1WRmrQZKmWMzbUxlyg8fOFWELmuw5Wc69EfpZazqgGlhh8kcrWX6OFKwXjBMFLSE8
         84Q1HL3Pyq7OjEvxKrTrcTlenmzyWDvbPkaNbloSzynveRhdylWlDdHZ2lM4LMPcbvcX
         9xqg==
X-Gm-Message-State: AOAM532toDH6fOpyfFuAt9nnsc8ykmOzi4D4LEX1QJSERe3WRQi2iFo/
        Pny9CeRmzP0vccUCswc3RP2IxQYAE8dqFQ==
X-Google-Smtp-Source: ABdhPJyYmXEe2dywkAWYdEIAL/2QLYY0sDhvRu+WM0S6XrXuy4LXVGo0fEyaVsUEJhpNTe3kPdqJNQ==
X-Received: by 2002:aa7:d045:: with SMTP id n5mr11372080edo.306.1611792899434;
        Wed, 27 Jan 2021 16:14:59 -0800 (PST)
Received: from [192.168.0.145] ([188.24.60.104])
        by smtp.gmail.com with ESMTPSA id f6sm2119847edv.83.2021.01.27.16.14.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 16:14:58 -0800 (PST)
To:     linux-media@vger.kernel.org
From:   GEO <geoubuntu@gmail.com>
Subject: Dereference of null pointer in get_media_devices.c
Message-ID: <a6cb9712-574e-a60e-7cf2-10fe18b25060@gmail.com>
Date:   Thu, 28 Jan 2021 02:14:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dereference of null pointer -> get_media_devices.c -> free_media_devices 
-> Access to field 'node' results in a dereference of a null pointer
