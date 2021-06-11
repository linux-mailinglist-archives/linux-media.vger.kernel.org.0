Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B57333A4459
	for <lists+linux-media@lfdr.de>; Fri, 11 Jun 2021 16:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbhFKOtp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Jun 2021 10:49:45 -0400
Received: from mail-qt1-f172.google.com ([209.85.160.172]:40800 "EHLO
        mail-qt1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbhFKOto (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Jun 2021 10:49:44 -0400
Received: by mail-qt1-f172.google.com with SMTP id t9so2740135qtw.7
        for <linux-media@vger.kernel.org>; Fri, 11 Jun 2021 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cp2w0T/qO/IPzagmW9I8LdQ69wCjSmt7fnkYkP55fzo=;
        b=WVpQS+/CW/sEVPKX3ecainYj67KDqVoPcmumo5UzZRZRC6Dpy5AFE4zMRJ11RuAxQy
         oYBijHMg4lDwUCAPXo5offJJvTQmVjlTWiFz/mWl1e+rvPiboATH6rMS3EmggLfyE4Qo
         e4gXVNiwTLogR3QBBdnEd5FgEsjzeenQR3oxMbpeJb7ivwg9ZKqN6DfK/yjYtzwpEAfg
         Xlj4V1Po7NANG/dwxt50Wc9vgOEcxk3DefnfNVhBdt8HHXx2dwkpTDN8zGchPB5Fbr9/
         AfzG50K+fy/5a2Ijff2M/UEVPZucIt+K9q4ZXkNiS+B/8Sp8A0BHe7oFro83qisv4aKx
         ezWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cp2w0T/qO/IPzagmW9I8LdQ69wCjSmt7fnkYkP55fzo=;
        b=fPQ4oU0fmT2blYTr3RYN20lDfpfR/kXDu9UJCo5ab1PKgBOLHFdbKBBMWEs1g/bmJl
         JfOd0jx6WbRvuvO43HA9Mq+iqOuVy4UGPFFMmSbve6NBPZkugW4+M6KV1SSnt1fHLmdr
         AYCCe2ajqSTFd/B3rDQdnyfMWriFQYRJgZXBZLdgIFu0j6z2Sd48pkKB4IhdC6JrGTfX
         8HWuUHlj88OTI1do80gXXkXL+dSRwyUetsTl3RM0Z4uqDBEGN/dzPGqVT8XP3s7yJOLz
         wR3WzjfMEJ1PjTA8ofRv+3gHrsyMIuEBh2HgN5lniyzeM2AoXLhjHz3dFEMg9ymTtV/X
         nt7A==
X-Gm-Message-State: AOAM532KkCVSj6yRv+aXIrkKMu/6A+GeIsDtSUVPQOspaO+m19Egxn+Z
        FhuVr1NXI2l4jZd5r30KvZEhDF2XN4msjFs0
X-Google-Smtp-Source: ABdhPJwtNOObIgvMseY0ZxKM3+tzNp5p7juGEQJS2qJqRxkCT8r1yUJ1P1AJVKzS9NZp73d+z/BcmQ==
X-Received: by 2002:ac8:45da:: with SMTP id e26mr4183090qto.193.1623422792549;
        Fri, 11 Jun 2021 07:46:32 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id p12sm4261413qtw.61.2021.06.11.07.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 07:46:32 -0700 (PDT)
Message-ID: <7bcab342492b41c952522c26eb2aaa497b90c5f8.camel@ndufresne.ca>
Subject: Re: [RFC/WIP 0/4] HEIC image encoder
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Date:   Fri, 11 Jun 2021 10:46:31 -0400
In-Reply-To: <3916c03f-9996-3de3-4365-3e88abf052d2@linaro.org>
References: <20210429132833.2802390-1-stanimir.varbanov@linaro.org>
         <ae54a98a-c1e5-e7f9-4d3f-fa4a56b9a359@xs4all.nl>
         <3916c03f-9996-3de3-4365-3e88abf052d2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 11 juin 2021 à 16:12 +0300, Stanimir Varbanov a écrit :
> > 
> > Would it be possible for the driver to handle this internally? I.e.,
> > if it detects that it needs to switch to grid mode, can it just encode
> > each grid and copy it in the capture buffer? This assumes that there is
> > metadata that can be used by a decoder do find and decode each grid.
> > 
> 
> In case that is is part of the spec I don't think we have to do it.
> Something more, when each tile is separate image the decoding process
> could be done in parallel.

Does it means there is no userspace (or at least no Open Source) userspace for
it ?


