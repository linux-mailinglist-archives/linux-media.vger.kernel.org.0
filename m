Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 848C350478
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 10:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727797AbfFXIYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 04:24:51 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36419 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727610AbfFXIYv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 04:24:51 -0400
Received: by mail-oi1-f193.google.com with SMTP id w7so9133959oic.3;
        Mon, 24 Jun 2019 01:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E3jCh9qUklT3VCdUR4q5N7iJlMFpI9mrn5VA3gt3u1Q=;
        b=MnZu01btG3wcO2YMqLdoORJUAWYdRdKzZwY6jorkGpGZrJfHlyrfvPTQ/N7IjjA5i4
         4N6FTMwOMwjeikBX+1SXXZVcK8GfgNxp7GnKn5EAM5+ibiXWhomVZUI9kHb5GZjWYoA6
         AVAUXW/GrEscaOGQEZ5D/gNet0CMNEbruv7EJlsVRDE+8jue5TDybEAxKqUVgFKpTSKu
         c8LtW+fKCblV3NDS6BzNX0XpIXPLZJHdhAwAEjrp1mhrcCeTR0O6AnARNNmF3vvAQvel
         MjC0Q03SaPqLcMi9aBz9V4K9LFHX09kdpX/0J1SehBeZfog4ARHlwGe+6RmwQGK9P4SP
         ZTCw==
X-Gm-Message-State: APjAAAWAOV28HMzgCdf12WOmsLM/TeMuub/Z/LTwNHXV4yQQGMZfepxZ
        E8iu7OKM79yRIXXO2OqwRuS/savWOsQBsNtWE0A=
X-Google-Smtp-Source: APXvYqzihRzgJI6Da1fwwk1b1HGBA/zUomwyKzrCy+m8mKILFeJn7sVYCPUgKweMXBaGhKY1tN+WrtikhqcJ1qQV7kw=
X-Received: by 2002:aca:5a41:: with SMTP id o62mr10256802oib.110.1561364690094;
 Mon, 24 Jun 2019 01:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190624035807.20628-1-standby24x7@gmail.com>
In-Reply-To: <20190624035807.20628-1-standby24x7@gmail.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 24 Jun 2019 10:24:36 +0200
Message-ID: <CAJZ5v0gsbLQz9-AD-891viTqxcuoDOZrrPUELXBsYgWExP3OgQ@mail.gmail.com>
Subject: Re: [PATCH] node: Fix warning while make xmldocs
To:     Masanari Iida <standby24x7@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 24, 2019 at 5:58 AM Masanari Iida <standby24x7@gmail.com> wrote:
>
> This patch fixes following warning while make xmldocs.
> ./drivers/base/node.c:690: warning: Excess function parameter
>  'mem_node' description in 'register_memory_node_under_compute_node'
> ./drivers/base/node.c:690: warning: Excess function parameter
>  'cpu_node' description in 'register_memory_node_under_compute_node'
>
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/base/node.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index d8c02e65df68..944ee45d122f 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -673,8 +673,8 @@ int register_cpu_under_node(unsigned int cpu, unsigned int nid)
>  /**
>   * register_memory_node_under_compute_node - link memory node to its compute
>   *                                          node for a given access class.
> - * @mem_node:  Memory node number
> - * @cpu_node:  Cpu  node number
> + * @mem_nid:   Memory node identifier
> + * @cpu_nid:   Cpu  node identifier
>   * @access:    Access class to register
>   *
>   * Description:
> --
> 2.22.0.190.ga6a95cd1b46e
>
