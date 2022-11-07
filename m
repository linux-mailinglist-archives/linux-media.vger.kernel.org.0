Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF05D61FB71
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 18:33:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbiKGRdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 12:33:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232879AbiKGRdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 12:33:00 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14441248E0
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 09:32:57 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id e15so8574444qvo.4
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 09:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OtwMIMageNgEFgITDbP/X4AlmExFVOD7QsjK39jRkOs=;
        b=ZrBbGd0NE5W3bFjfpMfVEGchJiOqL5vKGUnJZWHQEDCz71oryF6CDiPscJkkJaNeeg
         /pKDfIl6hW5yw8tjgrcZSOwrloCrFqYb1/s9Bc1/cV94xFkaKkZwH1bCSgyaTCtOH5Nq
         2ijwSehO6aXkrD87GuWevIaaXGPhzXmGc/u0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtwMIMageNgEFgITDbP/X4AlmExFVOD7QsjK39jRkOs=;
        b=X+GW0eZzkLrqb1ljrgezkO61I7tCq3wS2u55/TCCs764bJATWgj7izAlZWtEeZ4Zlr
         LSFltHEkm9Sh+15v2/mpeGKtsY+WRFK5GzKSwALEa69M5dbkvO7LQvOGlOjW3RtDDQA7
         w5Fe9qCMiB7PZkLsegvu4RNp7s3Uducl0rteqdkEHn6rq5umkuMjIrYDYN+KfynHdpSq
         TcvXBzfqFjny3XvB8kPg+7bLN93tBY0HueII5LV1WCU/a4BJbzEzLqWIcUgtGUz7RLRJ
         J90Jsec8x5qA75sixURAjfEyNhLHyj3GJyM91tAHHdGc9/UAwllJrsdggZw55p2+q7Od
         fyOg==
X-Gm-Message-State: ACrzQf3EZiiMeBBmlPdgBqB3OZJHGC1kBeKwzvWHO0HE7ooPYLYIaE/9
        MgpYbeOFYEHIS3KVh7YNMgUcM+AVJ+6JMQ==
X-Google-Smtp-Source: AMsMyM4M0sypTxzutNbKxVqxT5ET6b7wEOBm1/K5iIafxqXWf3NDjVyMEymEXPFylD6opeUp0zzgXw==
X-Received: by 2002:a0c:e3d3:0:b0:4bb:c033:76fc with SMTP id e19-20020a0ce3d3000000b004bbc03376fcmr43954368qvl.117.1667842375844;
        Mon, 07 Nov 2022 09:32:55 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id w27-20020a05620a0e9b00b006fa63cc7affsm7163469qkm.34.2022.11.07.09.32.54
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:32:54 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-3704852322fso111087777b3.8
        for <linux-media@vger.kernel.org>; Mon, 07 Nov 2022 09:32:54 -0800 (PST)
X-Received: by 2002:a05:6902:1352:b0:6bb:3f4b:9666 with SMTP id
 g18-20020a056902135200b006bb3f4b9666mr46634218ybu.101.1667842059236; Mon, 07
 Nov 2022 09:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com>
In-Reply-To: <20221107161740.144456-1-david@redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 7 Nov 2022 09:27:23 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
Message-ID: <CAHk-=wj51-dtxf8BQBYP+9Kc3ejq4Y0=-6hCbf_XAnkT3fsgDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 00/19] mm/gup: remove FOLL_FORCE usage from drivers
 (reliable R/O long-term pinning)
To:     David Hildenbrand <david@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Hugh Dickins <hughd@google.com>, Nadav Amit <namit@vmware.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Oded Gabbay <ogabbay@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 7, 2022 at 8:18 AM David Hildenbrand <david@redhat.com> wrote:
>
> So instead, make R/O long-term pinning work as expected, by breaking COW
> in a COW mapping early, such that we can remove any FOLL_FORCE usage from
> drivers.

Nothing makes me unhappy from a quick scan through these patches.

And I'd really love to just have this long saga ended, and FOLL_FORCE
finally relegated to purely ptrace accesses.

So an enthusiastic Ack from me.

                   Linus
