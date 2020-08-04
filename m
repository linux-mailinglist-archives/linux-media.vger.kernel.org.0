Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932DB23BBBB
	for <lists+linux-media@lfdr.de>; Tue,  4 Aug 2020 16:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbgHDOGu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Aug 2020 10:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728668AbgHDOGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Aug 2020 10:06:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D01E1C06174A
        for <linux-media@vger.kernel.org>; Tue,  4 Aug 2020 07:06:01 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id t23so20214375ljc.3
        for <linux-media@vger.kernel.org>; Tue, 04 Aug 2020 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=liddicott-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=oRWsHHCtGB6BG4CHfiTVmpUdAL/Z3G2VGiFutQbbcDM=;
        b=kA+05ELIc6x1Nn3s9AchI4oeIBy+mzkMZ7CIdZ6c92HtkZDwzzR/TYyAc/BgLUHKvv
         phynTHV7KffE1fF+UOeEgAa0Q8VVqJI7SKRmVA6xW7zntZE2Tz2jaC+1mEgD3UFshk6X
         VfrpzLZtgUYscHuZdYdcrDtbQwsg6IQTI+2afUqM4g5aIOJUMkXNC/t9+bU8MzH3c70X
         oGkRRbUDZgzzoR6KUUCD+6T0PfDNlAuvkSivBjko4VqgAJgSnTR2V0YUIXH43vw23veH
         V8n1GZjIj0G3fhSjoOI6PoAyj7IfUs5XRGyruo6Bc+UZSubsz1MJNrdi7FKHDFsL+pXy
         osRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=oRWsHHCtGB6BG4CHfiTVmpUdAL/Z3G2VGiFutQbbcDM=;
        b=CEKEK5CMpz4oTdap5J/Jovk3sw0tOQpl19YvjnP3bhFK2K+TIbJkCFLUQIppEQNfW1
         j/yskVTcU9z9PGpW5FFwvK4UxXJwasdAnMNNn7+xI59GBmisB9oo74ExrjaaHsQvYeA5
         Y5Gtgph4vzSOs4kEMHXMDOmD4+Nal3O/s6UdRz2tVd6u4cLXwVmSSqAZ8hfjPGRHIY/w
         oxNgkUs74Obg9G/mWi1xDhRMfCu7woFftfXysyZW9YoD+tLspMjhTNcGrWz6vg5RhC9q
         M5X1HmoDMefY1vnNMbu3amz7fmvExMrsICF5JJLTgSbckzOyti6px9fkZmyt/idsBZYx
         C4Mg==
X-Gm-Message-State: AOAM532lfY3mYmSaR4/4QCF5CECqrGPSe9Abizdr0WpXsmAZoho0N612
        2+hYZL8qkxozx0FINPJXBjyPta6TCXNPsJ+ZOoX+2/H7JE0=
X-Google-Smtp-Source: ABdhPJwXtXbC40Jss4Cnf93MZAkijzAc4qtAVXlVMciH6x3IpKVj++r9687l+VVD64IQWdYHGdGoRQsPdiJB6tSjpWU=
X-Received: by 2002:a2e:9843:: with SMTP id e3mr10476675ljj.57.1596549960081;
 Tue, 04 Aug 2020 07:06:00 -0700 (PDT)
MIME-Version: 1.0
From:   Simon Liddicott <simon@liddicott.com>
Date:   Tue, 4 Aug 2020 15:05:48 +0100
Message-ID: <CALuNSF479bQ0wPZbX_aK_j1JRuuwLhT=96ou420Wwdi2v1zR3Q@mail.gmail.com>
Subject: dtv-scan-tables maintenance
To:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        oliver@schinagl.nl
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

Who is maintaining the dtv-scan-tables tree?

There are a few outstanding patches.

Thanks,

Simon.
