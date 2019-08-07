Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B41084863
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 11:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387406AbfHGJFu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 05:05:50 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41798 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbfHGJFu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 05:05:50 -0400
Received: by mail-ot1-f68.google.com with SMTP id o101so101440064ota.8
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8BwIAe7n5xVP6Nja3mj9Ri+ZnAodKKOR6vMWA1vXrSY=;
        b=td04Xc6+7JIsj5FPGdddwqGdcsI+VVp6PGD/zsDZwszQaz6QkiTMCjZZv7eM0c13wY
         PWIaC3Csct78kFKOWz4GwLMCD5Mbl5XNVajx4tSM20n1YMhXb3TGTWAeD1C+gfbkgJBx
         XG8KEj4WWge5mMzhq64laHjmyEJ+/oIsNAbFaZn4VdvDm4vAPcDLtJ3owWusCs22YF0A
         4GNA8/18yv+bV6JoQePQWT++F+XfOpxPmIs66PKpC8+QWY9bPvEd8GVb2uPE2U6ziy66
         zmRoRJEBI+CDdiML/ElW2KgigEhF8WxViq2VvpgrzV4U6JzPCSsIUX3McQ5hyZ8lSw/G
         JeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8BwIAe7n5xVP6Nja3mj9Ri+ZnAodKKOR6vMWA1vXrSY=;
        b=Wbwr5eoFf3DeyTUqi+0TKrwDvCyiBGq7W59yeQVFGcNaapvyY/sMlZZePGeC1rXhCI
         xYczsxokjicUSniivqx3bZIDvP+wsoINJQsJ45Aqw6SmDHBjJ50Ek6L40ubUUH2mPEqn
         ubH5/aZkfTG3ui5cCvfhrhLvONiy6XaZ9qfsw2/lVhZdWmB4/tJTs4qhnIbhFaUe5E/C
         0WgN7rrZJVRY4lakQjNZcRVJqBl0lyWf/1AK+haRUaXwHlyyzEnBzAKu1BlVOHbDqh38
         VROjtA6QbdGL648eWtbuykb/dI9oom0xd3iS0nw4IWdLGHp0pGU/GzP+6MooN2x1kmQ8
         XJMA==
X-Gm-Message-State: APjAAAVxxD5u7QeryJOaQSdDDxal7N+EN9NDOSgtcd4uxxtoC1g2Jxrx
        4A0N13nsXu7UnVc8pQRHu9zwaEuuJ0eKLyIegw2DGw==
X-Google-Smtp-Source: APXvYqzg4Ub4diAdzTyCKVfjsxL446LB4v26uLo0IJv4p7lt/WDg645wxRk3TSadDRfhOtaTz5gIsHZ0qGG5reSLu4g=
X-Received: by 2002:a02:3b62:: with SMTP id i34mr9141343jaf.91.1565168749092;
 Wed, 07 Aug 2019 02:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190716122718.125993-1-darekm@google.com> <20190716122718.125993-8-darekm@google.com>
 <ee5f00e9-f865-28a9-2b4c-63bb8206d4cd@xs4all.nl>
In-Reply-To: <ee5f00e9-f865-28a9-2b4c-63bb8206d4cd@xs4all.nl>
From:   Dariusz Marcinkiewicz <darekm@google.com>
Date:   Wed, 7 Aug 2019 11:05:37 +0200
Message-ID: <CALFZZQHcD1Tc-yJdUOAvop1eM3hhBwN6nbtOqZm=QVjQPHwACA@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] drm: tegra: use cec_notifier_conn_(un)register
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans.

On Tue, Jul 30, 2019 at 2:17 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Dariusz,
>
> One comment below:
>
> >  int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
> >  {
> > +     struct cec_connector_info conn_info;
> >       int err;
> >
> >       if (output->panel) {
> > @@ -212,6 +209,13 @@ int tegra_output_init(struct drm_device *drm, struct tegra_output *output)
> >       if (gpio_is_valid(output->hpd_gpio))
> >               enable_irq(output->hpd_irq);
> >
> > +     cec_fill_conn_info_from_drm(&conn_info, &output->connector);
> > +
>
> This isn't right: tegra_output_init() is called for various output types, but the
> CEC adapter should only be created for an HDMI connector. So there should be
> a check on the connector type before registering a cec notifier.
>
I have just sent out v5 patch series. In there I've updated this patch
to limit the notifier creation only to HDMI connectors. From a cursory
look, though, it seems that so far that the notifier was created
regardless of connector type, so we are changing the existing behavior
here.

Best regards.
