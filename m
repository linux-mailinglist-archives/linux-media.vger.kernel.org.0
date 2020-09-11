Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1DF26622F
	for <lists+linux-media@lfdr.de>; Fri, 11 Sep 2020 17:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgIKPdW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Sep 2020 11:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIKPdA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Sep 2020 11:33:00 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A968BC061348;
        Fri, 11 Sep 2020 07:15:59 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id o68so7581726pfg.2;
        Fri, 11 Sep 2020 07:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/b9XBDQk1ajrYn0hzkaRXAYS7n96OUtEwCmlwlx4kE0=;
        b=WVGo0/vh5Ry5H3l7PXexj2/RL9waZahUbKk8WrUfbSNtbrB/RnC6ax2hezjYZ5yI/1
         zmW0sPUFpT7PJLWBdw+ycGOwlFjQStATATXF1D1N1J3vbCV5kFFnvVjeCmUrrJR0L6gy
         JU7mes/+p0ScZy0lwMcHqSNdwbeewByrV+H1Z0rmJgZCA5d78o3kBD3LlUQYwv9wq+20
         O6yumAaHEU+EHhXHfBdRbPR3mfSik+Aa68tTtlVFdr90W9F09QCu16qbaa9W3XdkThGm
         z7S6OwpDghpG80Y1moDUxX9v4RmtOaSOGjCiOUGhWVEYB6bpA2bqEWWHPR68UrTlSs5E
         jPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/b9XBDQk1ajrYn0hzkaRXAYS7n96OUtEwCmlwlx4kE0=;
        b=Z7fmv+MkrHeuyi6i3HiOPpVt9x6z8gVNgVCX9BmjLABZfK4Bcj8kJlLsORA2i4+OVt
         pFvi1+rYZIcOv/L0dLUujqaPa1kysrpc6ztx0GF6/moPxQTuIP32QFNb/58iIAEEF8Q8
         OLGCxA6nTJwk5eIddWLzG7iHJw9aD1ZjTdhVttELBn2sEh19XefBfsukl7tL59GMhK0W
         2B1q/IrG4SO9gKytvwV+tc7fpd0YfdPNpSlXr6aySXVl3XL2+FvfB1mwjySx549X7Z4g
         CRQqe1f/5OBOfVCEGovpXvZhtUwZ3vZGRVmshXr1yL0DBBYdQlQnp1IiyH3QZpsY7Nas
         abMg==
X-Gm-Message-State: AOAM533hY/eznjIO5WhTHC14DinpEprUkhfv/FNxAn2iC/Q7XmvI8b17
        c3ThijqOlBX//4dW7n4Nm58=
X-Google-Smtp-Source: ABdhPJxO8xBMW2b2qAKrC4EW1koJNssG2C6MihNWSugbwe/RG7EeVrT37R8Tt329rdW5Ddk8QeGqqA==
X-Received: by 2002:a17:902:8d86:b029:d1:9237:6dfd with SMTP id v6-20020a1709028d86b02900d192376dfdmr2515568plo.22.1599833758731;
        Fri, 11 Sep 2020 07:15:58 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id a74sm2546517pfa.16.2020.09.11.07.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 07:15:57 -0700 (PDT)
Date:   Fri, 11 Sep 2020 23:15:55 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Christoph Hellwig <hch@lst.de>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT flag
Message-ID: <20200911141555.GA535@jagdpanzerIV.localdomain>
References: <20200911030758.73745-1-sergey.senozhatsky@gmail.com>
 <20200911100919.GA1945@lst.de>
 <262a3acd-9070-8992-f13f-1f02bfe18eb8@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <262a3acd-9070-8992-f13f-1f02bfe18eb8@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On (20/09/11 12:37), Hans Verkuil wrote:
> I'll take care of that. I also discovered that one call to vb2_core_reqbufs()
> wasn't updated (in drivers/media/dvb-core/dvb_vb2.c). I've fixed that as well.

Oh.. how did I miss drivers/media/dvb-core/dvb_vb2.c?
Should have grep-ed more.

	-ss
