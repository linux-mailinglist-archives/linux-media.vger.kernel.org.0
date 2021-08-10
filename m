Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA41F3E859E
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 23:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbhHJVrG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 17:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbhHJVrG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 17:47:06 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B458EC061765
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 14:46:43 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r7so53224wrs.0
        for <linux-media@vger.kernel.org>; Tue, 10 Aug 2021 14:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2aRmmG6vEQVcbmATy1hVegLI10o7JHfhcSSCaErf6bg=;
        b=EpqLpHjGzaGFxGEiGVqlSyNWRF749Hj2h4aqXIvgj/XCPVLAss1AxlX/wrHWGsdbZc
         JBdzQPi2G0A81+vOAFPAxrqYVLYZFQNsGS8F7PnWCgBGHOJ44+59hROUsBG8itr7/3vl
         /7dGUyhwMqjkiDQXMh4pKnRrDnANAiga5oXHVUzMXn8/cjDnOPnYqtHMp0KyTo9vBj7C
         n5pXqLXZWP1xTTDBvmBkZfokZx0bOl4VRnzYeE3VnioJcxweARk7o+IgZ6BkNH88WkgT
         dsNi9WFcwv/pXa8AfV9FIND8GLRa1cpu8xr9WKZDv3+o2TtWle81n6XksObNwGxk2fHW
         qL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2aRmmG6vEQVcbmATy1hVegLI10o7JHfhcSSCaErf6bg=;
        b=kxXDNNnqoFckVp902NsehqliKPFG7gTk1lFgybfeeFHuDDekFBU1LnCiDcM1JvJqOw
         UQ6S+IJXP5gFMcaq5rJSyu6kyUeXKUumpdB/J0lGaXt1j+EH9DRsM4OgIfR1gSrNvALC
         Y5e2Q3gjDYvF3TquRRdMnvrlJllU3qy8nDqocU7y05vC+rEaDlhoVUlC7/FBGrwkxs+L
         rE5VLhcvnSsde0BwYaxIzHOc0U8gsZcAxtikJfD9S4zpnBcmq7J7wYT9Xo04aqPyGMyC
         QHWhFvbcbTEbyq5DCDHGe9fezAAa/QD4yUFHtUhZi+zpGXqMaiU3JFpZJGiT3FdZDmFF
         9mEQ==
X-Gm-Message-State: AOAM532+NVIUPuRbgNMgdatlXqZQuB1y2LsV7OO6VCjZYMZWL0iejqpR
        09h2zQkA7zHwueRYzow0aOA=
X-Google-Smtp-Source: ABdhPJw3tR0ARpzJpvi8ivaTIXUPUF4mWW7u/Qea5nYyS/s74TPDU9jxPNHqJoNH9Lg9Bdr9lh3e8Q==
X-Received: by 2002:a5d:6d82:: with SMTP id l2mr33263047wrs.225.1628632002338;
        Tue, 10 Aug 2021 14:46:42 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l41sm2764753wms.2.2021.08.10.14.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 14:46:41 -0700 (PDT)
Subject: Re: [PATCH v2 04/12] media: i2c: Support 19.2MHz input clock in
 ov8865
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        yong.zhi@intel.com, bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        kevin.lhopital@bootlin.com, yang.lee@linux.alibaba.com,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210809225845.916430-1-djrscally@gmail.com>
 <20210809225845.916430-5-djrscally@gmail.com>
 <CAHp75VfXjWkBLsxmDY6DtaU0cZjVsQntp2Q99hZkguWz6PQy9A@mail.gmail.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <a4c5592a-2350-9abb-b9c0-143ee6a028af@gmail.com>
Date:   Tue, 10 Aug 2021 22:46:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfXjWkBLsxmDY6DtaU0cZjVsQntp2Q99hZkguWz6PQy9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On 10/08/2021 14:04, Andy Shevchenko wrote:
>> +       ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
>> +                                      &rate);
>> +       if (!ret) {
> I'm wondering if something like
>
> ... rate = 0;
>
>        fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency", &rate);
>        if (rate > 0) {
>
> can be used.
Should be fine, and I agree that it makes the point of the check more
clear, thanks.
