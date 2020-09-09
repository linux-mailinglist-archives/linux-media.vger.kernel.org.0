Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00D5A26330D
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 18:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730831AbgIIQ4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 12:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730543AbgIIPw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Sep 2020 11:52:28 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434C3C06179A
        for <linux-media@vger.kernel.org>; Wed,  9 Sep 2020 04:56:46 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id nw23so3125715ejb.4
        for <linux-media@vger.kernel.org>; Wed, 09 Sep 2020 04:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ogwkQhFvnI4MZlMSYD/QWVKe2D0wYcRnW9BslwF6Qd0=;
        b=HBjuZLWTbosii7ivJ9Ywlo8ZE/yi+uOqSm+jpG3K3CaNg5EhfDmRwyHOQ+LkqQN5bt
         r8E9HZ0CmCpqg/EgdrmGDCLKPOyUAc9ZeexJq+vO0q3W1nwuh1hLu9isrW2iuMQ2Z5Mp
         wpUEZdWa955qmiMBbYZA+9GD7k/1thaZllOGhbKDLuva5LrgIEOuqFPXBjMmPe8vc3vK
         XsQKnEd31lZOKsyuLRftddoIyY6046V39zwwVyj5TbmwMijQthaBFY4YgPRywh8WzAff
         1ODAm8vxmT1yWtxFBnD0boY5J+gj+4ot/eICHddgbieS3nKkEl7LgwIjJLFpnV7AI9no
         Scyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ogwkQhFvnI4MZlMSYD/QWVKe2D0wYcRnW9BslwF6Qd0=;
        b=ifAaH3DjUdNI7cijDBMJorPyGtBadg69h6FwQz+PsoxCh7eONEXsMy3TDyKg1YX6Tb
         8hj/RY7DQJJwwOfjlY1pbAzoTDrxDGU9T2uY5ZeEWG1h4RAfEULO0/3Uj5MZWZqGIZeU
         /B65VerpjQ5pX6cEImwrAZ1XhlArosupX9nbVVTdTtZ0b8mPoLfGxRZm3YDCOqYy41k3
         bk8qHhYgvxF6RVIo+V581xN21PN70k6AwhoXLcoezOw+FXciWlsalOKDpPkO0E7bcm1T
         fwFiUObJtqt2zht+dswWtRI0WAgNCqwi9UcBUlrk1tftLNpByPJ/RbqR0mguSgKuY5Bl
         +cWQ==
X-Gm-Message-State: AOAM530A7vogbhXR0mn/izlfukSQjgPWMCQDuvMNexpQoy63vGuf638e
        hz+gg/Ty+czzaJHNC7Z56rm5GSTfBo2yuGat4Vux/g==
X-Google-Smtp-Source: ABdhPJxwxVcYxxRPx0hopbc/8wKbrEuh526OTa/mrDYz3ssckdGebxt8RtgFJRB+3GTtZQfvkNw7vv+GO+mnfJZRYag=
X-Received: by 2002:a17:906:3e90:: with SMTP id a16mr3019456ejj.363.1599652604922;
 Wed, 09 Sep 2020 04:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200903081550.6012-1-sakari.ailus@linux.intel.com>
 <20200903081550.6012-7-sakari.ailus@linux.intel.com> <CAMpxmJX40=iYYxL9Uvs1Pjj9c3NvZBGJ9Mh9-87T0c==FKEXRw@mail.gmail.com>
 <20200909111121.GJ2272@ninjato>
In-Reply-To: <20200909111121.GJ2272@ninjato>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 9 Sep 2020 13:56:34 +0200
Message-ID: <CAMpxmJXDrL92QH_Vb+P4LoQ-WGBMM42GvzXjquW2Lzotm5wggA@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] at24: Support probing while off
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 9, 2020 at 1:11 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
>
> > This currently conflicts with the fix I queued for at24 for v5.9.
> > Which tree is going to take this series?
>
> I recall we agreed on I2C.
>

Sakari,

can you rebase the at24 driver patch on top of Wolfram's tree as soon
as he merges my PR with at24 fixes?

Bartosz
