Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0FD07D0191
	for <lists+linux-media@lfdr.de>; Thu, 19 Oct 2023 20:32:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344662AbjJSScR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Oct 2023 14:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233250AbjJSScQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Oct 2023 14:32:16 -0400
X-Greylist: delayed 779 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 Oct 2023 11:32:14 PDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75B9CBB
        for <linux-media@vger.kernel.org>; Thu, 19 Oct 2023 11:32:14 -0700 (PDT)
Received: from [192.168.1.129] ([37.4.248.43]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MDykM-1qloNr04s0-009uH9; Thu, 19 Oct 2023 20:18:59 +0200
Message-ID: <0020ed1e-9a89-4c63-a3a2-4c506ba33865@i2se.com>
Date:   Thu, 19 Oct 2023 20:18:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: vc04_services: vchiq_bus: Do not kfree device
To:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-staging@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20231018055228.825524-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From:   Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20231018055228.825524-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kqgyPwBfsY6VtDAs/5SDo8sZ3fouhuZHcA25EM0m5/w8XjakqLv
 POOScfT1NpCVKD2BvBdVsmMlxZpnbfYduwT04pKUQCTVbyIVreQ26JIb9OjlyuS/Ap94MN6
 dKT+DX8IDBxrVJjuVPk99+A03tmtZlGzXh6+eZTaudmRr+Iv0BGGRhndy3RAWyPbebOaqJ6
 +nMaQQPPVbVBGN3QWrRWg==
UI-OutboundReport: notjunk:1;M01:P0:guFTyV1N3eg=;TYxEVp2puKUcjU0ZcKBCA6uNhhv
 3JgQbMCQS3rB+2w3/Yc4/xjT9ST9PdsiBLFQk0M00gsGAfqOfiJUXO+LZfHzs566gj3nMiIW6
 xjeU/RCdMM0cErFWBBt5YqabitNkLf39PWqssXy0AVzUiGMErWbt13EioMf/irSNbJUjaBBAU
 8mkLiZE5+wqsUFPBjL/3Lo7ATdJw+DnfzLyuoZnU0HoMmI3qGiFcLo5XdWLClqfyVxsye4FNx
 30SJ8UAHIWFHvMytbSMXqqyX4CBI19yA2z9iuObkKWALi+IPJ14jIfyF0kg44YGR6cWUbrCT9
 dvVHrKK8snhfhyLEEvp+onRH2kEt8QunM6llETCsa6zmC/JUVCGmzPqO/WR+JaGvFeN4ZMNBu
 csvL4i2kIuhxM4iaIpURVOx4ZRVwma7ijVrg55pLNDRLR9zQRMQoaqe4NRAjlcFcVq03IkCAw
 jiFLNJYEXI86sDGthnyuBfYRHJWpuWwUqGAMxmszldIPC8Vg1gs9+P9rq5VAHIW7uxKc2ah+N
 90p+nlBIkPWzNjhalSf7Jh0MBuuYu8y5lWSIsV78YoZ0DlYgCzRO7C+bKTJHERB8pqJFZ+VLm
 pG+XR7W6Wrul9BUQ0CKLQy49MbV+l6WD3K8pcAvbxH0L4NorpWnQJTPBv9hAcoqiZD2Dt9ogv
 3MWKt2UdUgS2J/bM85+vZc3dxCsLjC6H5XX7457bsGLhiKp2+hu6c+EoyAol8JrDXnsfDC/H8
 YBFF9tTIQnBVZVltPQHQAaYFOXv5vkpeEOR1drpXcebpk5DsKS7Xr38GWlQSKckqAQ0shYf01
 He4LxW3Rhi0sJ+f0lxkF9kFui28GisPMyoUKap49PizMIpxSGbge+n2R4xMuYZcwCvHfyAUw3
 OVrDWZW+rnaAt2Q==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 18.10.23 um 07:52 schrieb Umang Jain:
> As per device_register() documentation, this kfree() on error path will
> crash. The call to put_device() is all that is needed here to free the
> memory.
> 
> Fixes: 027e5703de6b ("staging: vc04_services: vchiq_arm: Add new bus type and device type")
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
