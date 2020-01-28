Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 542E014B5EA
	for <lists+linux-media@lfdr.de>; Tue, 28 Jan 2020 15:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgA1OBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jan 2020 09:01:00 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:59458 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727312AbgA1OAs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jan 2020 09:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=k7mipT3BnzZ+PHC6NfLwqWczHTzUdENJjYd9bPWXMwA=; b=gAwFtK9v/aki0/G4X/AOBrhS8Z
        SH7ASIawfR5k6boJuwEzIoepKWKEk5+IU1dp0Dc2RCQ6/0rLDEUKB6mtzGWKuvhUakw5IlOBEenDO
        tlu6pwShaH9xxRYQNdxpOW83U3RKmfcTk9OMl3CX7IqwoCxqh3n0TrV0DKYSvtxJjcZsuaq9euAhB
        OrfTnlM13UE+fzzemXC2Ynuce0VunszkE2DR/lFFz71EvnplhkZk9x4LAZ/k+tKX30G1IRPEfZGV4
        243+GsOzr+ZR6aVHJpbvkcxfRTbj7FN3zheQvp8Vq/MtcZPWJrvpTPpM8FoSXKxXzxEIieZqdGror
        Dbiv/6+g==;
Received: from [177.41.103.99] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iwRQ5-0007it-UO; Tue, 28 Jan 2020 14:00:47 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iwRPq-001BPH-4A; Tue, 28 Jan 2020 15:00:30 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 26/27] docs: kvm: Convert timekeeping.txt to ReST format
Date:   Tue, 28 Jan 2020 15:00:27 +0100
Message-Id: <c400eb627abd3bc80eb59d8cc0e647a7a71c655b.1580219586.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1580219586.git.mchehab+huawei@kernel.org>
References: <cover.1580219586.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Use document title and chapter markups;
- Add markups for literal blocks;
- Add markups for tables;
- use :field: for field descriptions;
- Add blank lines and adjust indentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/virt/kvm/index.rst              |   1 +
 .../kvm/{timekeeping.txt => timekeeping.rst}  | 221 ++++++++++--------
 2 files changed, 127 insertions(+), 95 deletions(-)
 rename Documentation/virt/kvm/{timekeeping.txt => timekeeping.rst} (85%)

diff --git a/Documentation/virt/kvm/index.rst b/Documentation/virt/kvm/index.rst
index e5ea75f97d52..7c1be8910837 100644
--- a/Documentation/virt/kvm/index.rst
+++ b/Documentation/virt/kvm/index.rst
@@ -18,6 +18,7 @@ KVM
    nested-vmx
    ppc-pv
    s390-diag
+   timekeeping
    vcpu-requests
 
    arm/index
diff --git a/Documentation/virt/kvm/timekeeping.txt b/Documentation/virt/kvm/timekeeping.rst
similarity index 85%
rename from Documentation/virt/kvm/timekeeping.txt
rename to Documentation/virt/kvm/timekeeping.rst
index 76808a17ad84..78f8979e1471 100644
--- a/Documentation/virt/kvm/timekeeping.txt
+++ b/Documentation/virt/kvm/timekeeping.rst
@@ -1,17 +1,19 @@
+======================================================
+Timekeeping Virtualization for X86-Based Architectures
+======================================================
 
-	Timekeeping Virtualization for X86-Based Architectures
+:Author: Zachary Amsden <zamsden@redhat.com>
+:Copyright: (c) 2010, Red Hat.  All rights reserved.
 
-	Zachary Amsden <zamsden@redhat.com>
-	Copyright (c) 2010, Red Hat.  All rights reserved.
+.. Contents
 
-1) Overview
-2) Timing Devices
-3) TSC Hardware
-4) Virtualization Problems
+   1) Overview
+   2) Timing Devices
+   3) TSC Hardware
+   4) Virtualization Problems
 
-=========================================================================
-
-1) Overview
+1. Overview
+===========
 
 One of the most complicated parts of the X86 platform, and specifically,
 the virtualization of this platform is the plethora of timing devices available
@@ -27,15 +29,15 @@ The purpose of this document is to collect data and information relevant to
 timekeeping which may be difficult to find elsewhere, specifically,
 information relevant to KVM and hardware-based virtualization.
 
-=========================================================================
-
-2) Timing Devices
+2. Timing Devices
+=================
 
 First we discuss the basic hardware devices available.  TSC and the related
 KVM clock are special enough to warrant a full exposition and are described in
 the following section.
 
-2.1) i8254 - PIT
+2.1. i8254 - PIT
+----------------
 
 One of the first timer devices available is the programmable interrupt timer,
 or PIT.  The PIT has a fixed frequency 1.193182 MHz base clock and three
@@ -50,13 +52,13 @@ The PIT uses I/O ports 0x40 - 0x43.  Access to the 16-bit counters is done
 using single or multiple byte access to the I/O ports.  There are 6 modes
 available, but not all modes are available to all timers, as only timer 2
 has a connected gate input, required for modes 1 and 5.  The gate line is
-controlled by port 61h, bit 0, as illustrated in the following diagram.
+controlled by port 61h, bit 0, as illustrated in the following diagram::
 
- --------------             ----------------
-|              |           |                |
-|  1.1932 MHz  |---------->| CLOCK      OUT | ---------> IRQ 0
-|    Clock     |   |       |                |
- --------------    |    +->| GATE  TIMER 0  |
+  --------------             ----------------
+  |            |           |                |
+  |  1.1932 MHz|---------->| CLOCK      OUT | ---------> IRQ 0
+  |    Clock   |   |       |                |
+  --------------   |    +->| GATE  TIMER 0  |
                    |        ----------------
                    |
                    |        ----------------
@@ -70,29 +72,33 @@ controlled by port 61h, bit 0, as illustrated in the following diagram.
                    |       |                |
                    |------>| CLOCK      OUT | ---------> Port 61h, bit 5
                            |                |      |
-Port 61h, bit 0 ---------->| GATE  TIMER 2  |       \_.----   ____
+  Port 61h, bit 0 -------->| GATE  TIMER 2  |       \_.----   ____
                             ----------------         _|    )--|LPF|---Speaker
                                                     / *----   \___/
-Port 61h, bit 1 -----------------------------------/
+  Port 61h, bit 1 ---------------------------------/
 
 The timer modes are now described.
 
-Mode 0: Single Timeout.   This is a one-shot software timeout that counts down
+Mode 0: Single Timeout.
+ This is a one-shot software timeout that counts down
  when the gate is high (always true for timers 0 and 1).  When the count
  reaches zero, the output goes high.
 
-Mode 1: Triggered One-shot.  The output is initially set high.  When the gate
+Mode 1: Triggered One-shot.
+ The output is initially set high.  When the gate
  line is set high, a countdown is initiated (which does not stop if the gate is
  lowered), during which the output is set low.  When the count reaches zero,
  the output goes high.
 
-Mode 2: Rate Generator.  The output is initially set high.  When the countdown
+Mode 2: Rate Generator.
+ The output is initially set high.  When the countdown
  reaches 1, the output goes low for one count and then returns high.  The value
  is reloaded and the countdown automatically resumes.  If the gate line goes
  low, the count is halted.  If the output is low when the gate is lowered, the
  output automatically goes high (this only affects timer 2).
 
-Mode 3: Square Wave.   This generates a high / low square wave.  The count
+Mode 3: Square Wave.
+ This generates a high / low square wave.  The count
  determines the length of the pulse, which alternates between high and low
  when zero is reached.  The count only proceeds when gate is high and is
  automatically reloaded on reaching zero.  The count is decremented twice at
@@ -103,12 +109,14 @@ Mode 3: Square Wave.   This generates a high / low square wave.  The count
  values are not observed when reading.  This is the intended mode for timer 2,
  which generates sine-like tones by low-pass filtering the square wave output.
 
-Mode 4: Software Strobe.  After programming this mode and loading the counter,
+Mode 4: Software Strobe.
+ After programming this mode and loading the counter,
  the output remains high until the counter reaches zero.  Then the output
  goes low for 1 clock cycle and returns high.  The counter is not reloaded.
  Counting only occurs when gate is high.
 
-Mode 5: Hardware Strobe.  After programming and loading the counter, the
+Mode 5: Hardware Strobe.
+ After programming and loading the counter, the
  output remains high.  When the gate is raised, a countdown is initiated
  (which does not stop if the gate is lowered).  When the counter reaches zero,
  the output goes low for 1 clock cycle and then returns high.  The counter is
@@ -118,49 +126,49 @@ In addition to normal binary counting, the PIT supports BCD counting.  The
 command port, 0x43 is used to set the counter and mode for each of the three
 timers.
 
-PIT commands, issued to port 0x43, using the following bit encoding:
+PIT commands, issued to port 0x43, using the following bit encoding::
 
-Bit 7-4: Command (See table below)
-Bit 3-1: Mode (000 = Mode 0, 101 = Mode 5, 11X = undefined)
-Bit 0  : Binary (0) / BCD (1)
+  Bit 7-4: Command (See table below)
+  Bit 3-1: Mode (000 = Mode 0, 101 = Mode 5, 11X = undefined)
+  Bit 0  : Binary (0) / BCD (1)
 
-Command table:
+Command table::
 
-0000 - Latch Timer 0 count for port 0x40
+  0000 - Latch Timer 0 count for port 0x40
 	sample and hold the count to be read in port 0x40;
 	additional commands ignored until counter is read;
 	mode bits ignored.
 
-0001 - Set Timer 0 LSB mode for port 0x40
+  0001 - Set Timer 0 LSB mode for port 0x40
 	set timer to read LSB only and force MSB to zero;
 	mode bits set timer mode
 
-0010 - Set Timer 0 MSB mode for port 0x40
+  0010 - Set Timer 0 MSB mode for port 0x40
 	set timer to read MSB only and force LSB to zero;
 	mode bits set timer mode
 
-0011 - Set Timer 0 16-bit mode for port 0x40
+  0011 - Set Timer 0 16-bit mode for port 0x40
 	set timer to read / write LSB first, then MSB;
 	mode bits set timer mode
 
-0100 - Latch Timer 1 count for port 0x41 - as described above
-0101 - Set Timer 1 LSB mode for port 0x41 - as described above
-0110 - Set Timer 1 MSB mode for port 0x41 - as described above
-0111 - Set Timer 1 16-bit mode for port 0x41 - as described above
+  0100 - Latch Timer 1 count for port 0x41 - as described above
+  0101 - Set Timer 1 LSB mode for port 0x41 - as described above
+  0110 - Set Timer 1 MSB mode for port 0x41 - as described above
+  0111 - Set Timer 1 16-bit mode for port 0x41 - as described above
 
-1000 - Latch Timer 2 count for port 0x42 - as described above
-1001 - Set Timer 2 LSB mode for port 0x42 - as described above
-1010 - Set Timer 2 MSB mode for port 0x42 - as described above
-1011 - Set Timer 2 16-bit mode for port 0x42 as described above
+  1000 - Latch Timer 2 count for port 0x42 - as described above
+  1001 - Set Timer 2 LSB mode for port 0x42 - as described above
+  1010 - Set Timer 2 MSB mode for port 0x42 - as described above
+  1011 - Set Timer 2 16-bit mode for port 0x42 as described above
 
-1101 - General counter latch
+  1101 - General counter latch
 	Latch combination of counters into corresponding ports
 	Bit 3 = Counter 2
 	Bit 2 = Counter 1
 	Bit 1 = Counter 0
 	Bit 0 = Unused
 
-1110 - Latch timer status
+  1110 - Latch timer status
 	Latch combination of counter mode into corresponding ports
 	Bit 3 = Counter 2
 	Bit 2 = Counter 1
@@ -177,7 +185,8 @@ Command table:
 	Bit 3-1 = Mode
 	Bit 0 = Binary (0) / BCD mode (1)
 
-2.2) RTC
+2.2. RTC
+--------
 
 The second device which was available in the original PC was the MC146818 real
 time clock.  The original device is now obsolete, and usually emulated by the
@@ -201,21 +210,21 @@ in progress, as indicated in the status register.
 The clock uses a 32.768kHz crystal, so bits 6-4 of register A should be
 programmed to a 32kHz divider if the RTC is to count seconds.
 
-This is the RAM map originally used for the RTC/CMOS:
+This is the RAM map originally used for the RTC/CMOS::
 
-Location    Size    Description
-------------------------------------------
-00h         byte    Current second (BCD)
-01h         byte    Seconds alarm (BCD)
-02h         byte    Current minute (BCD)
-03h         byte    Minutes alarm (BCD)
-04h         byte    Current hour (BCD)
-05h         byte    Hours alarm (BCD)
-06h         byte    Current day of week (BCD)
-07h         byte    Current day of month (BCD)
-08h         byte    Current month (BCD)
-09h         byte    Current year (BCD)
-0Ah         byte    Register A
+  Location    Size    Description
+  ------------------------------------------
+  00h         byte    Current second (BCD)
+  01h         byte    Seconds alarm (BCD)
+  02h         byte    Current minute (BCD)
+  03h         byte    Minutes alarm (BCD)
+  04h         byte    Current hour (BCD)
+  05h         byte    Hours alarm (BCD)
+  06h         byte    Current day of week (BCD)
+  07h         byte    Current day of month (BCD)
+  08h         byte    Current month (BCD)
+  09h         byte    Current year (BCD)
+  0Ah         byte    Register A
                        bit 7   = Update in progress
                        bit 6-4 = Divider for clock
                                   000 = 4.194 MHz
@@ -234,7 +243,7 @@ Location    Size    Description
                                  1101 = 125 mS
                                  1110 = 250 mS
                                  1111 = 500 mS
-0Bh         byte    Register B
+  0Bh         byte    Register B
                        bit 7   = Run (0) / Halt (1)
                        bit 6   = Periodic interrupt enable
                        bit 5   = Alarm interrupt enable
@@ -243,19 +252,20 @@ Location    Size    Description
                        bit 2   = BCD calendar (0) / Binary (1)
                        bit 1   = 12-hour mode (0) / 24-hour mode (1)
                        bit 0   = 0 (DST off) / 1 (DST enabled)
-OCh         byte    Register C (read only)
+  OCh         byte    Register C (read only)
                        bit 7   = interrupt request flag (IRQF)
                        bit 6   = periodic interrupt flag (PF)
                        bit 5   = alarm interrupt flag (AF)
                        bit 4   = update interrupt flag (UF)
                        bit 3-0 = reserved
-ODh         byte    Register D (read only)
+  ODh         byte    Register D (read only)
                        bit 7   = RTC has power
                        bit 6-0 = reserved
-32h         byte    Current century BCD (*)
+  32h         byte    Current century BCD (*)
   (*) location vendor specific and now determined from ACPI global tables
 
-2.3) APIC
+2.3. APIC
+---------
 
 On Pentium and later processors, an on-board timer is available to each CPU
 as part of the Advanced Programmable Interrupt Controller.  The APIC is
@@ -276,7 +286,8 @@ timer is programmed through the LVT (local vector timer) register, is capable
 of one-shot or periodic operation, and is based on the bus clock divided down
 by the programmable divider register.
 
-2.4) HPET
+2.4. HPET
+---------
 
 HPET is quite complex, and was originally intended to replace the PIT / RTC
 support of the X86 PC.  It remains to be seen whether that will be the case, as
@@ -297,7 +308,8 @@ indicated through ACPI tables by the BIOS.
 Detailed specification of the HPET is beyond the current scope of this
 document, as it is also very well documented elsewhere.
 
-2.5) Offboard Timers
+2.5. Offboard Timers
+--------------------
 
 Several cards, both proprietary (watchdog boards) and commonplace (e1000) have
 timing chips built into the cards which may have registers which are accessible
@@ -307,9 +319,8 @@ general frowned upon as not playing by the agreed rules of the game.  Such a
 timer device would require additional support to be virtualized properly and is
 not considered important at this time as no known operating system does this.
 
-=========================================================================
-
-3) TSC Hardware
+3. TSC Hardware
+===============
 
 The TSC or time stamp counter is relatively simple in theory; it counts
 instruction cycles issued by the processor, which can be used as a measure of
@@ -340,7 +351,8 @@ allows the guest visible TSC to be offset by a constant.  Newer implementations
 promise to allow the TSC to additionally be scaled, but this hardware is not
 yet widely available.
 
-3.1) TSC synchronization
+3.1. TSC synchronization
+------------------------
 
 The TSC is a CPU-local clock in most implementations.  This means, on SMP
 platforms, the TSCs of different CPUs may start at different times depending
@@ -357,7 +369,8 @@ practice, getting a perfectly synchronized TSC will not be possible unless all
 values are read from the same clock, which generally only is possible on single
 socket systems or those with special hardware support.
 
-3.2) TSC and CPU hotplug
+3.2. TSC and CPU hotplug
+------------------------
 
 As touched on already, CPUs which arrive later than the boot time of the system
 may not have a TSC value that is synchronized with the rest of the system.
@@ -367,7 +380,8 @@ a guarantee.  This can have the effect of bringing a system from a state where
 TSC is synchronized back to a state where TSC synchronization flaws, however
 small, may be exposed to the OS and any virtualization environment.
 
-3.3) TSC and multi-socket / NUMA
+3.3. TSC and multi-socket / NUMA
+--------------------------------
 
 Multi-socket systems, especially large multi-socket systems are likely to have
 individual clocksources rather than a single, universally distributed clock.
@@ -385,7 +399,8 @@ standards for telecommunications and computer equipment.
 It is recommended not to trust the TSCs to remain synchronized on NUMA or
 multiple socket systems for these reasons.
 
-3.4) TSC and C-states
+3.4. TSC and C-states
+---------------------
 
 C-states, or idling states of the processor, especially C1E and deeper sleep
 states may be problematic for TSC as well.  The TSC may stop advancing in such
@@ -396,7 +411,8 @@ based on CPU and chipset identifications.
 The TSC in such a case may be corrected by catching it up to a known external
 clocksource.
 
-3.5) TSC frequency change / P-states
+3.5. TSC frequency change / P-states
+------------------------------------
 
 To make things slightly more interesting, some CPUs may change frequency.  They
 may or may not run the TSC at the same rate, and because the frequency change
@@ -416,14 +432,16 @@ other processors.  In such cases, the TSC on halted CPUs could advance faster
 than that of non-halted processors.  AMD Turion processors are known to have
 this problem.
 
-3.6) TSC and STPCLK / T-states
+3.6. TSC and STPCLK / T-states
+------------------------------
 
 External signals given to the processor may also have the effect of stopping
 the TSC.  This is typically done for thermal emergency power control to prevent
 an overheating condition, and typically, there is no way to detect that this
 condition has happened.
 
-3.7) TSC virtualization - VMX
+3.7. TSC virtualization - VMX
+-----------------------------
 
 VMX provides conditional trapping of RDTSC, RDMSR, WRMSR and RDTSCP
 instructions, which is enough for full virtualization of TSC in any manner.  In
@@ -431,14 +449,16 @@ addition, VMX allows passing through the host TSC plus an additional TSC_OFFSET
 field specified in the VMCS.  Special instructions must be used to read and
 write the VMCS field.
 
-3.8) TSC virtualization - SVM
+3.8. TSC virtualization - SVM
+-----------------------------
 
 SVM provides conditional trapping of RDTSC, RDMSR, WRMSR and RDTSCP
 instructions, which is enough for full virtualization of TSC in any manner.  In
 addition, SVM allows passing through the host TSC plus an additional offset
 field specified in the SVM control block.
 
-3.9) TSC feature bits in Linux
+3.9. TSC feature bits in Linux
+------------------------------
 
 In summary, there is no way to guarantee the TSC remains in perfect
 synchronization unless it is explicitly guaranteed by the architecture.  Even
@@ -448,13 +468,16 @@ despite being locally consistent.
 The following feature bits are used by Linux to signal various TSC attributes,
 but they can only be taken to be meaningful for UP or single node systems.
 
-X86_FEATURE_TSC 		: The TSC is available in hardware
-X86_FEATURE_RDTSCP		: The RDTSCP instruction is available
-X86_FEATURE_CONSTANT_TSC 	: The TSC rate is unchanged with P-states
-X86_FEATURE_NONSTOP_TSC		: The TSC does not stop in C-states
-X86_FEATURE_TSC_RELIABLE	: TSC sync checks are skipped (VMware)
+=========================	=======================================
+X86_FEATURE_TSC			The TSC is available in hardware
+X86_FEATURE_RDTSCP		The RDTSCP instruction is available
+X86_FEATURE_CONSTANT_TSC	The TSC rate is unchanged with P-states
+X86_FEATURE_NONSTOP_TSC		The TSC does not stop in C-states
+X86_FEATURE_TSC_RELIABLE	TSC sync checks are skipped (VMware)
+=========================	=======================================
 
-4) Virtualization Problems
+4. Virtualization Problems
+==========================
 
 Timekeeping is especially problematic for virtualization because a number of
 challenges arise.  The most obvious problem is that time is now shared between
@@ -473,7 +496,8 @@ BIOS, but not in such an extreme fashion.  However, the fact that SMM mode may
 cause similar problems to virtualization makes it a good justification for
 solving many of these problems on bare metal.
 
-4.1) Interrupt clocking
+4.1. Interrupt clocking
+-----------------------
 
 One of the most immediate problems that occurs with legacy operating systems
 is that the system timekeeping routines are often designed to keep track of
@@ -502,7 +526,8 @@ thus requires interrupt slewing to keep proper time.  It does use a low enough
 rate (ed: is it 18.2 Hz?) however that it has not yet been a problem in
 practice.
 
-4.2) TSC sampling and serialization
+4.2. TSC sampling and serialization
+-----------------------------------
 
 As the highest precision time source available, the cycle counter of the CPU
 has aroused much interest from developers.  As explained above, this timer has
@@ -524,7 +549,8 @@ it may be necessary for an implementation to guard against "backwards" reads of
 the TSC as seen from other CPUs, even in an otherwise perfectly synchronized
 system.
 
-4.3) Timespec aliasing
+4.3. Timespec aliasing
+----------------------
 
 Additionally, this lack of serialization from the TSC poses another challenge
 when using results of the TSC when measured against another time source.  As
@@ -548,7 +574,8 @@ This aliasing requires care in the computation and recalibration of kvmclock
 and any other values derived from TSC computation (such as TSC virtualization
 itself).
 
-4.4) Migration
+4.4. Migration
+--------------
 
 Migration of a virtual machine raises problems for timekeeping in two ways.
 First, the migration itself may take time, during which interrupts cannot be
@@ -566,7 +593,8 @@ always be caught up to the original rate.  KVM clock avoids these problems by
 simply storing multipliers and offsets against the TSC for the guest to convert
 back into nanosecond resolution values.
 
-4.5) Scheduling
+4.5. Scheduling
+---------------
 
 Since scheduling may be based on precise timing and firing of interrupts, the
 scheduling algorithms of an operating system may be adversely affected by
@@ -579,7 +607,8 @@ In an attempt to work around this, several implementations have provided a
 paravirtualized scheduler clock, which reveals the true amount of CPU time for
 which a virtual machine has been running.
 
-4.6) Watchdogs
+4.6. Watchdogs
+--------------
 
 Watchdog timers, such as the lock detector in Linux may fire accidentally when
 running under hardware virtualization due to timer interrupts being delayed or
@@ -587,7 +616,8 @@ misinterpretation of the passage of real time.  Usually, these warnings are
 spurious and can be ignored, but in some circumstances it may be necessary to
 disable such detection.
 
-4.7) Delays and precision timing
+4.7. Delays and precision timing
+--------------------------------
 
 Precise timing and delays may not be possible in a virtualized system.  This
 can happen if the system is controlling physical hardware, or issues delays to
@@ -600,7 +630,8 @@ The second issue may cause performance problems, but this is unlikely to be a
 significant issue.  In many cases these delays may be eliminated through
 configuration or paravirtualization.
 
-4.8) Covert channels and leaks
+4.8. Covert channels and leaks
+------------------------------
 
 In addition to the above problems, time information will inevitably leak to the
 guest about the host in anything but a perfect implementation of virtualized
-- 
2.24.1

