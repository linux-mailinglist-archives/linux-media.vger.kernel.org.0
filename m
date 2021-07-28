Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39FBE3D8572
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 03:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbhG1Bef (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 21:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233170AbhG1Bef (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 21:34:35 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE787C061757
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 18:34:34 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id i10so762880pla.3
        for <linux-media@vger.kernel.org>; Tue, 27 Jul 2021 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CHNdGPdcHOtmxq1n3bSuGfaiBQ5x58VlCSNHnpx2KYE=;
        b=K39CkRY+G7dAlNdSPhwNl41/bIBoJJGvbZBN0Tvzy7ONi3SLglODq64EJgGVhsdvc7
         5aIPitwodqpLTTcTGS7Ig3URo7pYYRC1jKrinDXkUZob0ckGmedDJ2nCU0dG/MyGz8FO
         uZPRXDhe/VFP9X8CjwIMuGf2srh+0AP0avz2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CHNdGPdcHOtmxq1n3bSuGfaiBQ5x58VlCSNHnpx2KYE=;
        b=htTAeXrZMl+8LkCdFMpZQ+00UV+XFJAdhEuhWydcm0thNrIw2rBRHR7dw59stW0utE
         ivyN42vC5EM6jiLeQe8bf/xRLputCrQpTBvmPWZwU6d40vboaHXOS0w+vwDEyWl2/Aj/
         1yXsElNAeRw/siF0NNV6U7NMWiveikuQkFZyNMYlTMUXA5H4EkKvkVraYzdxlJzqGdOp
         g6ytByZZRdvSbf6itumb0tR2SDZHpiEl16vG+adVFdG8gwwDJDHkfMBuVosHH/4rvgXn
         wwNbM8iZNa+E+yVt/Ve6MDHM4toXQLeSs5cgDshhrIeM24XAPcWYNIrLs6qKkncuAa+l
         yAYw==
X-Gm-Message-State: AOAM531zi1AA12TOLYhmT9htxJ0SnHX0CwfVcwgHYdgSuSzScRAXlRyp
        94gl02oxOf5TnGmx/dc9/gGwZg==
X-Google-Smtp-Source: ABdhPJyd/FDXyXtXstUrgJFfb6oARu7hBxSpupBi/Tqa96kzllycLOVHpneauB6gfKfNVV1LhC8JLQ==
X-Received: by 2002:a05:6a00:2383:b029:32d:827:1e29 with SMTP id f3-20020a056a002383b029032d08271e29mr25403595pfc.77.1627436074261;
        Tue, 27 Jul 2021 18:34:34 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:ba3e:509b:495:ec84])
        by smtp.gmail.com with ESMTPSA id w10sm5548740pgl.46.2021.07.27.18.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:34:33 -0700 (PDT)
Date:   Wed, 28 Jul 2021 10:34:29 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        robert.foss@linaro.org, tian.shu.qiu@intel.com,
        senozhatsky@chromium.org, tfiga@chromium.org,
        bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: ov8856: ignore gpio and regulator for ov8856 with
 ACPI
Message-ID: <YQC0JeCGEIkUxcjJ@google.com>
References: <1625563129-12696-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625563129-12696-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (21/07/06 17:18), Bingbu Cao wrote:
> 
> For ov8856 working with ACPI, it does not depend on the reset gpio
> and regulator to do reset and power control, so should get the gpio
> and regulator for non-ACPI cases only, otherwise it will break ov8856
> with ACPI.
> 

LGTM

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
