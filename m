Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D13140DA0D
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 14:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239612AbhIPMjv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Sep 2021 08:39:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239561AbhIPMju (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Sep 2021 08:39:50 -0400
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F009C061574
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 05:38:30 -0700 (PDT)
Received: by mail-ua1-x936.google.com with SMTP id r8so3870345uap.0
        for <linux-media@vger.kernel.org>; Thu, 16 Sep 2021 05:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0vConzKPLEXeSY5isEj44b9ioB3WiTKXOOeH8M/qhMg=;
        b=ZOd3cKON6cosT+oUHSUoX8lYXRB1ivz8ksbhrz2g13ab681NxxqUYouzoyOdApRjHN
         9C7G3gkXybIsaQK6CR0OXJbCoityPI/bsDx9cxeBDryg0SrTlJdsGYQHAjRZcFqHNnep
         w8T/bY5gwyKErMCiBenZMnLf2a/1lO38d9s9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0vConzKPLEXeSY5isEj44b9ioB3WiTKXOOeH8M/qhMg=;
        b=wZwiwqwXRpjJM66ENarwGvPDVCVjRbcV0bXt0yhQ8KVzUygb6JpSfoLZctoqoEDbuq
         TspM7g4eiCnfy8vWH2cAjv0W8/VS9KDzCYh8AoNVUiySAuWi/SMDRCI1tHehvnFmYmze
         iVcuRKwMLeG7TjjvaI18k6byyimuHr7U4OWLXkm80beWI+Cg8IoCO/A1hOZy0fh5L4oH
         K5qDCzD4f0XwX9dZjKXxDgOF82cT4AWyR1/DGoxA+g9mPVWvwGUFvQslT68fBCBjq+PK
         MGmoeZSZgXhNCsJzb2sHvvzcpSsXW8AubNtf1tYMUq+yMoYSjlIgx7vDby9Oso/BWMVY
         hK9w==
X-Gm-Message-State: AOAM531jSuWdNjGzPV3Smiu3wsF9+3ULK0qgrGDMEkuOEaAv819ndwlX
        IYdeBVvxX0S/qyE9Xlk2tIomQBPpPTkKUB2Sbkvp/JQItbh2Qw==
X-Google-Smtp-Source: ABdhPJwWiK0lSKm+XTwl96Bf3/5KQdNtghCcUqgRmYvdz8qjWXlQJhdlhbS1vXZu/Mk2fnAln2bQsGBTgBZfLDmB4Dg=
X-Received: by 2002:ab0:10f:: with SMTP id 15mr3588186uak.113.1631795908405;
 Thu, 16 Sep 2021 05:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210915162324.25513-1-dafna.hirschfeld@collabora.com>
In-Reply-To: <20210915162324.25513-1-dafna.hirschfeld@collabora.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Thu, 16 Sep 2021 21:38:17 +0900
Message-ID: <CAFr9PXkpEDfa_P_UfTCwrBHOMsqyGm8MQgOsY=_OjFGc4+ApAQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] staging: media: wave5: add wave5 codec driver
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        bob.beckett@collabora.com, kiril.bicevski@collabora.com,
        Nas Chung <nas.chung@chipsnmedia.com>,
        lafley.kim@chipsnmedia.com, scott.woo@chipsnmedia.com,
        olivier.crete@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Thu, 16 Sept 2021 at 01:23, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> The wave5 codec is a stateful encoder/decoder.
> It is found on the JH7100 SoC.
>

For what it's worth; I think this is also the video decoder block on
the SigmaStar SSD201/SSD202D (32bit ARM..) that have some limited
support in mainline.

Cheers,

Daniel
