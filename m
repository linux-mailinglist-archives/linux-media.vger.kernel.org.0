Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1CB4673B3
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 10:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351238AbhLCJMV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 04:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243758AbhLCJMV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 04:12:21 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA3BC06173E
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 01:08:57 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id y12so8559477eda.12
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 01:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=6Wg6czQSvk9ESSIqa1asfKPD9dM25bzqCfPa/gFcQeY=;
        b=Ht66g3Tp+ed/OjVW8CNVbdc/3z/rdNJS7lvH8QTz+PBEYAkkLrKWMFulF+4l91AIQV
         EHdOP7JaYziF2uj8mapgLrA+szps7N0S7Nw+1rLx/OcdcFfYg1mr0Zob74Vv1BP2C6yr
         AFUyRp8tMLG1uo32TXo0p/pxRNZm9GWOXyNmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=6Wg6czQSvk9ESSIqa1asfKPD9dM25bzqCfPa/gFcQeY=;
        b=4sKpZrYXTrWGosscKkU5L6vlr05ez1Ci2egoJj4OIKYuRvewnNIPsNkzHkniPyXeQH
         v1YcntMMA+Q1mKYKZImTYWkIhUX4PjaO8NpC7MbFNfcWEGAoKkvHYLG1JUF3LontXyt3
         6Gk0lQ4M4ZB+TMQ3sTw+yFJiA3wG9DQkYUcPvNVQFkqRSFy09KSrwzlqY6ZG7AQOVB3Y
         f51ddZ58tRi+xgw0MOVGuxWbNhQBaG5zXIjfdtwK/+0zXCpla4jO8aFiNykOM3Ppgq4C
         XWB0XZBFKz+PhZFqZiLBo2i2V7EzVR/N1GsduBIwIH505Teba9Ei6bEZeDbisjgSqjL3
         yLPQ==
X-Gm-Message-State: AOAM5308VO16GACpuXlvxDamXO3lUuTGeBTWBj9vjplu8T09eMt7cq9A
        BdKxbCoXjluQf7PojBUecKGt0PBmNeDn4w==
X-Google-Smtp-Source: ABdhPJxYPZfYYzhO4o+uR+MhWWoOLylMFebPdYqY0Dzdo87EFFrFPvo7t7pqpkEQBnGe50GE1tJU5w==
X-Received: by 2002:a17:907:e8a:: with SMTP id ho10mr21829844ejc.191.1638522536118;
        Fri, 03 Dec 2021 01:08:56 -0800 (PST)
Received: from karbon.home.net (212-5-158-115.ip.btc-net.bg. [212.5.158.115])
        by smtp.gmail.com with ESMTPSA id nd22sm1633548ejc.98.2021.12.03.01.08.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 01:08:55 -0800 (PST)
Date:   Fri, 3 Dec 2021 11:08:55 +0200
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     linux-media@vger.kernel.org
Subject: ovm6211 linux driver
Message-ID: <YanepzHYQMH/DfHY@karbon.home.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

	Hi guys,

On request by certain company we've developed a media driver for OmniVision's 
ovm6211 camera sensor.  We just got permission to mainline the code.  How shall 
i proceed?


cheers,
Petko
