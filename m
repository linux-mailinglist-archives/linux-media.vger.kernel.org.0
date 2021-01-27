Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48AB9306554
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 21:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232777AbhA0Unc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 15:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233256AbhA0Un3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 15:43:29 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D1AC061573;
        Wed, 27 Jan 2021 12:42:49 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id a20so1991696pjs.1;
        Wed, 27 Jan 2021 12:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=heAqkYphZYwX3mYVMDdP10R2l2TFo2HmDmbz1DiFkNE=;
        b=K0T81wAKtAFxYGJqnI8tNi9jqePKm9zDwFtaAH9ROlxwFJ3ja4XBrZdQlyTB3YScyf
         Vs4wulo78erERFxQi1GI3/yzOPf8n2KcHcd6ZaZNx13DndiA8fyqLbb1rUQk4PdQF83O
         +xVsD8JcOvts1HfSuUZJsVjhIrP+d+n14QYMS5S+cFI/6r9FFVUZY8rsLK3Fh06ERuP4
         M3634ytlArQvdjfLm0ABdYmDYFPOAxhp65cYAgefIb3U+yukrn/HuaRK7FzQaxVcbjcI
         5MTN0gqK/4/1MKgl3iyejTRBDCFeT57wU5DZmJG4owiXL9r7dttpDJI9Uh6WClas3X9O
         TjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=heAqkYphZYwX3mYVMDdP10R2l2TFo2HmDmbz1DiFkNE=;
        b=ajM6cD9VvPywMcGN3S8+p2xWtsG3XzjSIiNEBbt04HNe/w3zzh+3JrWmdqYY0HBIJo
         JuPG+h0y0b+pCEVGM39nI+xCd6EdAYRuEf/16LN7ijAJTEu3KzhFiQmU8BUYPRjH8Kyj
         vRThnVFjBhbEI2qqOxMi+FATAcc5lFa3f/naAQH3OMWxOzhaV2rUTZZmB0/Y47TFw8xX
         MxP78fbOUEJ6hyFMBwXGioV3tRvUN0jBSiuvka8noi3FiHkLJTJh+WESV5bwifqZP5lQ
         qsF3Tb2oX+M12jwChd4PS92xyV1FfDvnutplXZhyWaq22M/hkpd5SjFcPv9pbdg/rLuv
         jUkQ==
X-Gm-Message-State: AOAM532QjvgJ/FU9KiIEmS8QZ7gYwue0VBSAZPKGnqcrKlbUS2RVszZO
        12P4i8afUWVb4FZ/WwkEEss=
X-Google-Smtp-Source: ABdhPJyrDUsN/Czs9FxNo3YQSGdUkHSsN4MG+RN/LXd3icOH8HO4d6Aya9e6WjnHk3Ic8QmrVWjzeQ==
X-Received: by 2002:a17:902:edcd:b029:df:d2b1:ecf0 with SMTP id q13-20020a170902edcdb02900dfd2b1ecf0mr13184394plk.15.1611780169223;
        Wed, 27 Jan 2021 12:42:49 -0800 (PST)
Received: from google.com ([2620:15c:211:201:9dd5:b47b:bb84:dede])
        by smtp.gmail.com with ESMTPSA id a72sm3457344pfa.126.2021.01.27.12.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 12:42:47 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Wed, 27 Jan 2021 12:42:45 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Michal Hocko <mhocko@suse.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, hyesoo.yu@samsung.com,
        david@redhat.com, surenb@google.com, pullip.cho@samsung.com,
        joaodias@google.com, hridya@google.com, john.stultz@linaro.org,
        sumit.semwal@linaro.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, hch@infradead.org, robh+dt@kernel.org,
        linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 2/4] mm: failfast mode with __GFP_NORETRY in
 alloc_contig_range
Message-ID: <YBHQRY8kw8/wjFK8@google.com>
References: <20210121175502.274391-1-minchan@kernel.org>
 <20210121175502.274391-3-minchan@kernel.org>
 <20210125131200.GG827@dhcp22.suse.cz>
 <YA8dEFSrHBb9muFr@google.com>
 <20210126074449.GA827@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126074449.GA827@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 26, 2021 at 08:44:49AM +0100, Michal Hocko wrote:
> On Mon 25-01-21 11:33:36, Minchan Kim wrote:
> > On Mon, Jan 25, 2021 at 02:12:00PM +0100, Michal Hocko wrote:
> > > On Thu 21-01-21 09:55:00, Minchan Kim wrote:
> > > > Contiguous memory allocation can be stalled due to waiting
> > > > on page writeback and/or page lock which causes unpredictable
> > > > delay. It's a unavoidable cost for the requestor to get *big*
> > > > contiguous memory but it's expensive for *small* contiguous
> > > > memory(e.g., order-4) because caller could retry the request
> > > > in different range where would have easy migratable pages
> > > > without stalling.
> > > > 
> > > > This patch introduce __GFP_NORETRY as compaction gfp_mask in
> > > > alloc_contig_range so it will fail fast without blocking
> > > > when it encounters pages needed waiting.
> > > 
> > > I am not against controling how hard this allocator tries with gfp mask
> > > but this changelog is rather void on any data and any user.
> > > 
> > > It is also rather dubious to have retries when then caller says to not
> > > retry.
> > 
> > Since max_tries is 1 with ++tries, it shouldn't retry.
> 
> OK, I have missed that. This is a tricky code. ASYNC mode should be
> completely orthogonal to the retries count. Those are different things.
> Page allocator does an explicit bail out based on __GFP_NORETRY. You
> should be doing the same.

Before sending next revision, let me check this part again.

I want to use __GFP_NORETRY to indicate "opportunistic-easy-to-fail attempt"
and I want to use ASYNC migrate_mode to help the goal.

Do you see the problem?
