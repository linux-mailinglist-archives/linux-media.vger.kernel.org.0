Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C55D36F5F6
	for <lists+linux-media@lfdr.de>; Fri, 30 Apr 2021 08:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhD3Gx0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Apr 2021 02:53:26 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:54765 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229610AbhD3Gx0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Apr 2021 02:53:26 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id cN0slg2kkk1MGcN0vlRwIm; Fri, 30 Apr 2021 08:52:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1619765557; bh=96NtEN8uwly4oANY7+z8pjE0XS8SfS7LB109Td37vQw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=RWlI7HOhdOTRtQ+rwt4jdbgZ2FN0h+td+xC1u5P8GoY4DXEHJKTKxv3wXcLXzAa8K
         UrJwlkDokbKsjgeV0wKIiYpadX24Yjg0vsvNPAsutJRunSm6OigHHlz2O7FPy4kerY
         X+G1Q2JJf+m0QMH/xe8Mrv5umVPx1j4jtfbvKnHa16WrUtf5LgG8vTPTnAUg0g9Nr4
         7ZrNV52tUsSZFljQRqmEqncuc7pq0viKSYSCIhWkr7byP/63a1MUN19iTERhXQqQD3
         VimYKbr1EtiZuMuWhfPHrL2MVtoIAEHm192BMgy5UBnecBzSiTZhYVIysXRyLDxR9+
         FsnBIAeRnbgcg==
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [RFC] Move meson/vdec out of staging?
Message-ID: <cecdec24-d3ed-1bab-5144-018f685b9374@xs4all.nl>
Date:   Fri, 30 Apr 2021 08:52:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHu64q0aQmgljNuAUPFiPx8ZHetH6b33GeGDY9mCynDlh+eSdmpelUP0ZQeLbZrlJPO4UDI9nCq2XC42zj7/bTH8zt+2kdOHdeJX9e7MfckIKr8P+AKB
 COjUNWkriTCIJWDoBQ6xwjOujiIpk81EHkeV97nft/2ApVYkpb9VS7FdZLhwlN+Jlkm+S1y8jfMjgS6Vrktahn6wX53X3RWE3lkgiPD1LSkw/AlyOn9FLnP/
 NSmLdzQc6FvWofZ4SbQppp4RTDoIcG2X28x/kovDK9Q=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Neil,

Is there anything still keeping meson/vdec in staging? The TODO says:

"This driver is in staging until the V4L2 documentation about stateful video
decoders is finalized, as well as the corresponding compliance tests.

It is at the moment not guaranteed to work properly with a userspace
stack that follows the latest version of the specification, especially
with compression standards like MPEG1/2 where the driver does not support
dynamic resolution switching, including the first one used to determine coded
resolution."

Certainly the first part is done, so what is the status of the second part?

It would be nice to move this out of staging, or, if that is not possible,
at least update the TODO file and ideally have someone work on the remaining
issues.

Regards,

	Hans
