Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 211A07A66D1
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 16:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbjISOgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 10:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232845AbjISOgR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 10:36:17 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E31C6
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 07:36:11 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-495e049a28bso2400357e0c.1
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 07:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1695134170; x=1695738970; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1OuljT+gRiSQe08oai+nLM69blu0YJmN8P8SkaNahOE=;
        b=aCgVi/Imq/HsuKqnka+YuAUfXfPukpkEtF0C0CrbCGbO1mF7mTGmfJ7oktvaUAwcNd
         mZVh8gQEPCdHg5RJPlaSU753kmBGwXYruvXXGzYW5Dk/HOKn2MBVRDAQvjqCL/6yxey9
         48VyPMInbtoc4V4DL6s0H6Af5zzcBvhD/6e8o8sFpc3zBMBdPj789BCAIgBj/MW6IW30
         DsJq0CdeoQ8tQwAddWAle8YNptGK6DoOjhjNwY3Nif6ttj+5K17rHul9ZmwzfD35D945
         G0dVaZqnLoDT8oq9ZsHJ/EruXI8K/CB7eHC0uLaNThctkhtQVy0Xtg9tHBl9jm5ajTKE
         NWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695134170; x=1695738970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OuljT+gRiSQe08oai+nLM69blu0YJmN8P8SkaNahOE=;
        b=dYK2d1WgjFZVi+lJa3ZRMnPF916HvKyeDVvwhn5v1HLPH4BghcWpBKgFY0dDMST1zx
         q/YAxa+HxHYWPrWSx+TKpOgPIWOnJ9iVUWlpeMsXJuLPI5poE2KRttCp2sGUfJ0N3KMs
         1THs25AKRSWqCmOYi72iXDF02J42KkzCqSLM51yjmClHAkZVdJ3oBmOVvB4jFRiBRm6u
         m5GbsBVuSI9RDy4LxiSI9SWoJdLNg8lOLk/Zxh1qE72NuSiYbhtAeVi9LHUN395dXk9r
         NiAOwPj7GtplMtuebQE7q3+ifQQUju4bq4Qj/RvNHERumC+WBAgkFKPQaHnHJQqXD0H9
         P9zQ==
X-Gm-Message-State: AOJu0YyCfv3A1LmUATE02KeL1S6bSJqT1VWF4W7orWgIpcgRBoWU7tHN
        YcH0kkKJZ6dPUobOQTdwGJj/ABUYshf+N6CaM96Ms5n7rhiWZtPD
X-Google-Smtp-Source: AGHT+IHEHkrLCEHVcCHp0piCiNiVBhgWy5p1ZkQbi5YzxoH7A6V/001j6NKe27QYeIKIZbxVUbK5+qMurATt3gAiAe8=
X-Received: by 2002:ac5:cd50:0:b0:496:cd75:333c with SMTP id
 n16-20020ac5cd50000000b00496cd75333cmr4073762vkm.11.1695134170411; Tue, 19
 Sep 2023 07:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230919111540.2344757-1-sakari.ailus@linux.intel.com>
 <20230919111540.2344757-2-sakari.ailus@linux.intel.com> <CAPY8ntCVWUoK6vcbRB8Pw_0_pV8tP7dXWZY=OMaBeaMMFjVVqg@mail.gmail.com>
 <ZQmxhwe5mlBWMc8p@kekkonen.localdomain>
In-Reply-To: <ZQmxhwe5mlBWMc8p@kekkonen.localdomain>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 19 Sep 2023 15:35:54 +0100
Message-ID: <CAPY8ntB4matN1pKotEfj477YTA2ef5O6Pre3MO1XCrZ=bciVCg@mail.gmail.com>
Subject: Re: [PATCH 1/4] media: ov9282: Orphan the driver
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 19 Sept 2023 at 15:34, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Tue, Sep 19, 2023 at 02:16:11PM +0100, Dave Stevenson wrote:
> > Hi Sakari
> >
> > On Tue, 19 Sept 2023 at 12:17, Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > The current maintainers won't be looking after this driver anymore. Mark
> > > it orphan.
> >
> > Seeing as a fair number of Pi users are using OV9281 (same sensor but
> > different CRA), I'm prepared to step up as maintainer for this one.
>
> I'm happy to hear that!
>
> > Do you want me to create a patch to update MAINTAINERS, or are you
> > happy to create one and me R-b or Ack it?
>
> I'm fine with either. :-) Perhaps it's easiest if I change the current
> patch?

Fine by me.

  Dave

> --
> Regards,
>
> Sakari Ailus
